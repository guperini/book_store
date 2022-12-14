import '../../../core/controllers/internet_connection_listener.dart';
import 'package:get/get.dart';

import '../../../core/app/app_controller.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Controllers

    Get.lazyPut(() => InternetConnectionListener());
    Get.lazyPut(() => AppController(Get.find()));
    Get.lazyPut(() => SplashController(Get.find()));
  }
}
