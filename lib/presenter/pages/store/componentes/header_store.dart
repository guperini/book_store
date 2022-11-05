import 'package:book_store/presenter/widgets/round_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store_controller.dart';

class HeaderStore extends GetWidget<StoreController> {
  const HeaderStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          const SizedBox(height: 15),
          RoundContainer(
            verticalPadding: 30,
            width: 160,
            height: 30,
            onTap: () => controller.onlyFavoriteBooks(),
            radius: 10,
            backgroundColor: controller.showOnlyFavoriteBooks.value ? Colors.white : Colors.grey[300]!,
            //   borderColor: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("My favorite books  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: controller.showOnlyFavoriteBooks.value ? Colors.black : Colors.grey)),
                Icon(
                  Icons.star,
                  color: controller.showOnlyFavoriteBooks.value ? Colors.yellow : Colors.grey,
                  size: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
