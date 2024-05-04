import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_location.freezed.dart';

@freezed
class CustomLocation with _$CustomLocation {
  const factory CustomLocation({
    required double latitude,
    required double longitude,
    required double heading,
  }) = _CustomLocation;

  factory CustomLocation.empty() => const CustomLocation(
        latitude: 0.0,
        longitude: 0.0,
        heading: 0.0,
      );
}
