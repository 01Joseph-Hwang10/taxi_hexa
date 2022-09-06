import 'package:flutter/material.dart';

ValueNotifier<void> mapUpdater = ValueNotifier<void>(null);

void updateMap() {
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  mapUpdater.notifyListeners();
}
