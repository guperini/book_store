import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/app/app_routes.dart';
import 'package:get/get.dart';

import '../../../core/app/app_controller.dart';

class SplashController extends GetxController {
  final AppController appController;

  SplashController(this.appController);

  // observable variables

  RxBool get showGoToStoreButton => (!isLoading.value).obs;

  final isLoading = true.obs;

  // methods

  // prints logical and physical size when debugging.
  // Usage: to emulate to Windows or MacOs and test diferent screen sizes
  debugPrintScreenSizeLogicalAndPhysical(
    BuildContext context,
  ) {
    debugPrint('Logical  => H ${context.height} X ${context.width} W');
    debugPrint('Physical => H ${window.physicalSize.height} X ${window.physicalSize.width} W');
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    isLoading.value = false;

    super.onInit();
  }

  onGoToStoreButtonPressed() {
    Get.toNamed(Routes.store);
  }
}
