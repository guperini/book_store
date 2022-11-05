import 'package:book_store/presenter/pages/book_details/book_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/round_container.dart';

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
        child: ListView(
          padding: const EdgeInsets.all(20),
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
