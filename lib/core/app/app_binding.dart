import 'package:get/get.dart';

import '../controllers/internet_connection_listener.dart';
import 'app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // controllers
    Get.lazyPut(() => InternetConnectionListener());
    Get.lazyPut(() => AppController(Get.find()));
  }
}
