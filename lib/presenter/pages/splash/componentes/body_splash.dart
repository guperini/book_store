import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../splash_controller.dart';

class BodySplash extends GetView<SplashController> {
  const BodySplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text('BODY'),
      ],
    );
    
  }
}