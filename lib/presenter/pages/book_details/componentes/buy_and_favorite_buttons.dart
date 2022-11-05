import 'package:book_store/presenter/pages/book_details/book_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/default_button.dart';
import '../../../widgets/round_container.dart';

class BuyAndFavoriteButtons extends GetWidget<BookDetailsController> {
  const BuyAndFavoriteButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (controller.book.value.volumeInfo?.infoLink != null)
          SizedBox(
            height: 30,
            width: Get.width * 0.35,
            child: DefaultButton(
                elevation: 0,
                onPressed: () {
                  launchUrl(Uri.parse(controller.book.value.volumeInfo!.infoLink!.replaceAll('http:', 'https:')));
                },
                textSize: 12,
                text: 'Buy'),
          ),
        Obx(
          () => RoundContainer(
            shadow: false,
            verticalPadding: 20,
            width: Get.width * 0.35,
            onTap: () => controller.onPressedFavoriteButton(),
            borderColor: controller.isFavorite.value ? Colors.yellow : Colors.grey,
            radius: 30,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FAVORITE   ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: controller.isFavorite.value ? Colors.black : Colors.grey, fontSize: 12),
                ),
                Obx(
                  () => Icon(
                    Icons.star,
                    color: controller.isFavorite.value ? Colors.yellow : Colors.grey,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
