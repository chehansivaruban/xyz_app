import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/app_state/app_state.dart';
import '../../application/app_state/app_state_notifier.dart';
import '../../application/core/internet_connectivity/internet_connectivity_provider.dart';
import '../../config.dart';
import '../../utils/log_utils.dart';
import 'base_request_response.dart';

parseJson(String text) {
  return compute(jsonDecode, text);
}

class ApiHelper {
  ApiHelper({
    required this.ref,
    required this.dio,
    required this.appStateNotifier,
    required this.appState,
  }) {
    _logUtils.log("init");
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) async {
          switch (e.response?.statusCode) {
            case 401:
              // Implement token refresh logic here
              break;
            default:
              return handler.next(e);
          }
        },
      ),
    );
  }

  final AppState appState;
  final AppStateNotifier appStateNotifier;
  Dio dio;
  final Ref ref;

  static final _logUtils = LogUtils(
    featureName: 'ApiHelper',
    printLog: true,
  );

  Future<dynamic> request(
    HttpMethod method,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool addDefaultParams = true,
    bool isLive = false,
    bool isExternal = false,
    bool isFormData = false,
  }) async {
    try {
      if (!ref.read(internetConnectivityNotifierProvider).isConnected) {
        return const BaseResponse(
            isSuccess: false, code: 404, error: 'No Network');
      }
      if (!isExternal) {
        final baseUrl = isLive ? Config.liveServerUrl : Config.serverUrl;
        dio.options.baseUrl = baseUrl;
      }
      dio.options.headers['Tz'] = 'Europe/London';
      var params = isExternal
          ? <String, dynamic>{}
          : addDefaultParams
              ? await _getCommonParameters()
              : <String, dynamic>{};
      params.addAll(data ?? {});
      var headersValue = isExternal
          ? <String, dynamic>{}
          : addDefaultParams
              ? await _getCommonParameters()
              : <String, dynamic>{};
      headersValue.addAll(headers ?? {});

      final options = Options(
        method: method.name.toUpperCase(),
        // headers: headersValue,
      );
      final res = await dio.request(
        path,
        data: isFormData ? FormData.fromMap(params) : data,
        queryParameters: queryParameters,
        options: options,
      );

      return _handleResponse(
        res,
        isExternal,
      );
    } on DioException catch (e) {
      _logUtils.log("DioException encountered: ${e.message}");
      return BaseResponse(
          isSuccess: false,
          code: e.response?.statusCode ?? 999,
          error: 'Dio Error');
    } catch (e) {
      _logUtils.log("Exception encountered: $e");
      return BaseResponse(
          isSuccess: false,
          code: 999,
          error: Config.isDebugMode ? e.toString() : 'Unknown Error');
    }
  }

  Future<dynamic> _handleResponse(
    Response res,
    bool isExternal,
  ) async {
    switch (res.statusCode) {
      case 200:
        if (isExternal) {
          _logUtils.log("External response: ${res.data}");
          return res;
        } else {
          final responseConvert = {
            "isSuccess": true,
            "data": res.data,
          };

          final response = BaseResponse.fromJson(responseConvert);

          if (!response.isSuccess &&
              response.code == 403 &&
              appState.loggedIn) {
            return BaseResponse(
              isSuccess: false,
              code: res.statusCode!,
              error: 'Not authenticated',
            );
          } else if (!response.isSuccess &&
              response.code == 113 &&
              appState.loggedIn) {
            return BaseResponse(
              isSuccess: false,
              code: res.statusCode!,
              error: 'User Not Found',
            );
          } else {
            return response;
          }
        }
      case 300:
        //get refresh token
        return BaseResponse(
          isSuccess: false,
          code: res.statusCode!,
          error: 'Token Expired',
        );
      case 401:
        return BaseResponse(
          isSuccess: false,
          code: res.statusCode!,
          error: 'Not authenticated',
        );
      case 403:
        return BaseResponse(
          isSuccess: false,
          code: res.statusCode!,
          error: 'Not authenticated',
        );
      case 500:
        return BaseResponse(
          isSuccess: false,
          code: res.statusCode!,
          error: 'Server error',
        );
      default:
        return const BaseResponse(
          isSuccess: false,
          code: 0,
          error: 'Server error',
        );
    }
  }

  Future<Map<String, dynamic>> _getCommonParameters() async {
    return {};
  }
}

enum HttpMethod {
  get,
  post,
  put,
  patch,
}
