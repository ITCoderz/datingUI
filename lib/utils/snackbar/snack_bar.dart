import 'package:dating/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarAlerts {
  SnackBarAlerts._();

  static successAlert({
    required String message,
  }) {
    Get.snackbar(
      "Success",
      message,
      backgroundColor: CColors.primaryColor,
      colorText: Colors.white,
    );
  }

  static warningAlert({
    required String message,
  }) {
    Get.snackbar(
      "Attention",
      message,
      backgroundColor: CColors.primaryColor,
      colorText: Colors.white,
    );
  }
}
