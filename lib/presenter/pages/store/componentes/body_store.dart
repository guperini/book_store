import 'package:book_store/core/app/app_routes.dart';
import 'package:book_store/presenter/pages/store/componentes/book_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store_controller.dart';

class BodyStore extends GetWidget<StoreController> {
  const BodyStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          controller: controller.scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: controller.booksToShow.length,
          itemBuilder: (context, index) {
            final item = controller.booksToShow[index];
            return BookItem(
              key: Key(item.id!),
              book: item,
              onTap: () => Get.toNamed(
                Routes.bookDetails,
                arguments: item,
              ),
              isFavorite: controller.box.get(item.id) ?? false,
            );
          },
        ),
      ),
    );
  }
}
