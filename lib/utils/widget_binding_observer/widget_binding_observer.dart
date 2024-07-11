import 'package:flutter/material.dart';


class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      debugPrint("Removing the Cart Model from the Storage.");
      // Get.find<StorageController>().deleteCartModel();
    }
    if (state == AppLifecycleState.inactive) {
      debugPrint("State Is Inactive");
    }
    if (state == AppLifecycleState.resumed) {
      debugPrint("State Is Resumed");
    }
  }
}
