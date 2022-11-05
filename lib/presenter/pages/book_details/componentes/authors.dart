import 'package:book_store/presenter/pages/book_details/book_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authors extends GetWidget<BookDetailsController> {
  const Authors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
                  Text("Author${controller.authors.length > 1 ? 's: ' : ': '}", style: const TextStyle(fontSize: 12)),
            ),
            Expanded(
              child: Text(
                controller.getAuthorsString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        )
      ],
    );
  }
}
