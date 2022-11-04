import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void call(
    String title,
    String? description, {
    Color? backgroundColor,
    Duration? duration,
    Color? colorText,
  }) {
    Get.snackbar(
      title,
      description ?? 'Tente novamente mais tarde',
      dismissDirection: DismissDirection.vertical,
      colorText: colorText ?? Colors.white,
      backgroundColor: backgroundColor ?? Colors.red.withOpacity(0.8),
      duration: duration ?? const Duration(seconds: 4),
    );
  }
}
