import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/core/failure.dart';

part 'current_location_state.freezed.dart';

@freezed
class CurrentLocationState with _$CurrentLocationState {
  const factory CurrentLocationState({
    required bool isCurrentLocationLoading,
    required bool? isPermissionAvailable,
    required bool? isServiceAvailable,
    required bool isServiceAlertOpen,
    required bool isPermissionAlertOpen,
    required Position currentPossition,
    required Option<Failure> responseFailure,
  }) = _CurrentLocationState;

  factory CurrentLocationState.initial() => CurrentLocationState(
      isCurrentLocationLoading: false,
      isPermissionAvailable: null,
      isServiceAvailable: null,
      isPermissionAlertOpen: false,
      isServiceAlertOpen: false,
      responseFailure: none(),
      currentPossition: Position(
        altitudeAccuracy: 0.0,
        latitude: 0.0,
        longitude: 0.0,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
        headingAccuracy: 0.0,
      ));
}
