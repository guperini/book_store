import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../book_details_controller.dart';

class BodyBookDetails extends GetView<BookDetailsController> {
  const BodyBookDetails({Key? key}) : super(key: key);

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