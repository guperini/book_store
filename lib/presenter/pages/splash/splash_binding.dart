import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {

    // DataSources ou Adapters

    // Repositories

    // Usecases

    // Controllers
    Get.put(SplashController(Get.find()));
  }
  
}
