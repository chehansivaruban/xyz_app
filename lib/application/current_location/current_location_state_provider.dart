import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'current_location_notifier.dart';
import 'current_location_state.dart';

final currentLocationNotifierProvider =
    StateNotifierProvider<CurrentLocationStateNotifier, CurrentLocationState>(
        (ref) {
  return CurrentLocationStateNotifier();
});
