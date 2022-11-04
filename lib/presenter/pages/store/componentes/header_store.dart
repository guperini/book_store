import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store_controller.dart';

class HeaderStore extends GetWidget<StoreController> {
  const HeaderStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() => Text('HEADER: ${controller.allBooks.length}')),
      ],
    );
  }
}
