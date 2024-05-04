import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xyz_app/application/app_state/app_state.dart';
import 'package:xyz_app/application/app_state/app_state_notifier.dart';
import 'package:xyz_app/domain/core/i_local_repository.dart';
import 'package:xyz_app/domain/core/values/constants.dart';

class MockLocalRepository extends Mock implements ILocalRepository {}

void main() {
  late AppState appState;
  late AppStateNotifier sut;
  late MockLocalRepository mockLocalRepository;

  setUp(
    () {
      appState = AppState.initial();
      mockLocalRepository = MockLocalRepository();
      sut = AppStateNotifier(mockLocalRepository);
    },
  );
  test(
    "App State :: App State Initial value test",
    () {
      expect(appState.loggedIn, false);
      expect(appState.token, '');
      expect(appState.isAppStarted, none());
    },
  );

  group(
    "App State :: appStart()",
    () {
      test(
        "App State :: When the logged in is false",
        () async {
          when(() => mockLocalRepository.read(StorageKeys.isLoggedIn))
              .thenAnswer((_) async => right('false'));
          when(() => mockLocalRepository.read(StorageKeys.token))
              .thenAnswer((_) async => right(''));

          await sut.appStart();

          expect(sut.state.loggedIn, false);
          expect(sut.state.token, '');
          expect(sut.state.isAppStarted, some(true));
        },
      );
    },
  );
  group(
    "App State :: App Authentication",
    () {
      test(
        "App State :: logout()",
        () async {
          when(() => mockLocalRepository.deleteLogin())
              .thenAnswer((_) async => right(unit));

          await sut.logout();

          expect(sut.state.loggedIn, false);
          expect(sut.state.token, '');
        },
      );
    },
  );
}
