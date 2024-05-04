import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/log_utils.dart';
import 'current_location_state.dart';

class CurrentLocationStateNotifier extends StateNotifier<CurrentLocationState> {
  CurrentLocationStateNotifier() : super(CurrentLocationState.initial()) {
    {
      _logUtils.log("init");
    }
  }

  static final LogUtils _logUtils = LogUtils(
    featureName: "CurrentLocationStateNotifier",
    printLog: true,
  );

  @override
  void dispose() {
    _logUtils.log("dispose");
    super.dispose();
  }

  Future<void> handleLocationPermission() async {
    _logUtils.log("handleLocationPermission");
    final serviceEnabled = await _checkLocationService();
    final permission = await _checkLocationPermission();

    state = state.copyWith(
      isServiceAvailable: serviceEnabled,
      isPermissionAvailable: permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always,
    );
  }

  void setIsServiceAlert(bool value) {
    _logUtils.log("setIsServiceAlert");
    state = state.copyWith(
      isServiceAlertOpen: value,
    );
  }

  void setIsPermissionAlert(bool value) {
    state = state.copyWith(
      isPermissionAlertOpen: value,
    );
  }

  Future<bool> _checkLocationService() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    return serviceEnabled;
  }

  Future<LocationPermission> _checkLocationPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
    } else {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  Future<void> getCurrentLocation() async {
    _logUtils.log("getCurrentLocation");
    bool hasPermission = (state.isPermissionAvailable ?? false) &&
        (state.isServiceAvailable ?? false);
    if (hasPermission) {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (position.longitude != state.currentPossition.longitude ||
          position.latitude != state.currentPossition.latitude) {
        state = state.copyWith(
          currentPossition: position,
        );
        _logUtils.log(
            "getCurrentLocation :: lattitude ${position.latitude} longitude ${position.longitude}");
      }

      return;
    } else {
      await handleLocationPermission();
    }
  }
}
