import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../constants/theme_data.dart';
import 'app_binding.dart';
import 'app_controller.dart';
import 'app_routes.dart';

class AppWidget extends GetWidget<AppController> {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appTitle,
      theme: themeData,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      initialRoute: Routes.initial,
      getPages: AppRoutes.routes,
      initialBinding: AppBinding(),
    );
  }
}
