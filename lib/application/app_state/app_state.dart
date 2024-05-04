import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    // main stated of the app
    required bool isLoading,
    required bool loggedIn,
    required String token,
    required String refreshToken,
    required Option<bool> isAppStarted,
  }) = _AppState;

  factory AppState.initial() => AppState(
        isLoading: true,
        loggedIn: false,
        token: '',
        refreshToken: '',
        isAppStarted: none(),
      );
}
