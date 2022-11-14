import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/round_container.dart';
import '../book_details_controller.dart';

class BookDescription extends GetWidget<BookDetailsController> {
  const BookDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      horizontalPadding: 5,
      shadow: false,
      radius: 10,
      height: Get.height * 0.30,
      child: Scrollbar(
        thumbVisibility: true,
        controller: controller.scrollController,
        child: ListView(
          padding: const EdgeInsets.all(20),
          controller: controller.scrollController,
          children: [
            const Text(
              "Description",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              controller.book.value.volumeInfo?.description ?? '',
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
