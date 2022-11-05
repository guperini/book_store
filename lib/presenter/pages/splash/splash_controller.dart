import 'package:book_store/core/app/app_routes.dart';
import 'package:get/get.dart';

import '../../../core/app/app_controller.dart';

class SplashController extends GetxController {
  final AppController appController;

  SplashController(this.appController);

  // observable variables

  RxBool get showGoToStoreButton => (appController.isConnected.value && !isLoading.value).obs;

  final isLoading = true.obs;

  // métodos

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;

    super.onInit();
  }

  onGoToStoreButtonPressed() {
    Get.toNamed(Routes.store);
  }
}
