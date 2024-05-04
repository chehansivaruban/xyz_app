import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/core/values/constants.dart';
import '../../../utils/log_utils.dart';
import '../../domain/core/i_local_repository.dart';
import '../../utils/string_extensions.dart';
import 'app_state.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier(this._localRepository) : super(AppState.initial()) {
    _logUtils.log("init");
  }

  static final LogUtils _logUtils = LogUtils(
    featureName: "AppStateNotifier",
    printLog: true,
  );

  final ILocalRepository _localRepository;

  @override
  void dispose() {
    _logUtils.log("dispose");
    super.dispose();
  }

  Future<void> appStart() async {
    _logUtils.log("appStart : before state : $state");
    state = state.copyWith(
      isAppStarted: none(),
    );
    final isLoggedIn = (await _localRepository.read(StorageKeys.isLoggedIn))
        .getOrElse(() => false.toString())
        .toBool();

    if (!isLoggedIn) {
      state = state.copyWith(
        loggedIn: false,
        isAppStarted: some(true),
      );
      _logUtils.log("appStart : after state !isLoggedIn : $state");
      //TODO: Find a better solution for this
      // App.appRouter.replaceAll(
      //   const [
      //     OnboardingRoute(),
      //   ],
      // );
      return;
    } else {
      //fetch the data from local storage and update the state
      final token =
          (await _localRepository.read(StorageKeys.token)).getOrElse(() => '');

      final refreshToken =
          (await _localRepository.read(StorageKeys.refreshToken))
              .getOrElse(() => '');

      state = state.copyWith(
        loggedIn: isLoggedIn,
        token: token,
        refreshToken: refreshToken,
        isAppStarted: some(true),
      );

      _logUtils.log("appStart : after state : $state");
    }
  }

  Future<void> logout() async {
    await _localRepository.deleteLogin();
    state = AppState.initial();
  }
}
