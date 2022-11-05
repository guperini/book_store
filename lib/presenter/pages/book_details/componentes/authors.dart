import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../book_details_controller.dart';

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
