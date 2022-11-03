import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';
import 'componentes/header_splash.dart';
import 'componentes/body_splash.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          HeaderSplash(),
          BodySplash(),
        ],
      ),
    );
  }
}
