import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/default_button.dart';
import '../../widgets/loading_indicator.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.debugPrintScreenSizeLogicalAndPhysical(context);

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              const Text(Constants.appTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 65, fontWeight: FontWeight.bold)),
              const SizedBox(height: 80),
              if (controller.isLoading.value) const LoadingIndicator(),
              const Spacer(),
              if (controller.showGoToStoreButton.value)
                DefaultButton(
                  horizontalPadding: 60,
                  elevation: 5,
                  onPressed: () => controller.onGoToStoreButtonPressed(),
                  text: "GO TO STORE",
                ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
