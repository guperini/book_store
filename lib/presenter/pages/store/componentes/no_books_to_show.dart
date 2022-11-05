import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoBooksToShow extends StatelessWidget {
  const NoBooksToShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: Get.height * 0.35),
        const Text(
          "No books to show!",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
