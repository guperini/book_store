import 'package:get/get.dart';

import 'book_details_controller.dart';

class BookDetailsBinding extends Bindings {

  @override
  void dependencies() {

    // DataSources ou Adapters

    // Repositories

    // Usecases

    // Controllers
    Get.put(BookDetailsController(Get.find()));
  }
  
}
