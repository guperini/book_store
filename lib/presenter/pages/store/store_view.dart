import 'package:book_store/presenter/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_controller.dart';
import 'componentes/header_store.dart';
import 'componentes/body_store.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            const HeaderStore(),
            const Expanded(child: BodyStore()),
            if (controller.isloading.value)
              const SizedBox(
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: LoadingIndicator(size: 20),
                  ))
          ],
        ),
      ),
    );
  }
}
