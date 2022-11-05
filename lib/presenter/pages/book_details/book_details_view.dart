import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book_store/presenter/widgets/default_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/constants/constants.dart';

import '../../widgets/loading_indicator.dart';
import 'book_details_controller.dart';
import 'componentes/authors.dart';
import 'componentes/book_description.dart';
import 'componentes/buy_and_favorite_buttons.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  const BookDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            height: Get.height * 0.4,
            imageUrl: controller.book.value.volumeInfo!.imageLinks?.thumbnail ?? Constants.bookNoImagePlaceHolder,
            placeholder: (context, url) => const LoadingIndicator(
              size: 20,
              color: Colors.grey,
            ),
            errorWidget: (context, url, error) {
              return const Icon(Icons.image_not_supported);
            },
          ),
          // Book title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(controller.book.value.volumeInfo?.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          if (controller.authors.isNotEmpty) const Authors(),
          const BuyAndFavoriteButtons(),

          // Book description
          if (controller.book.value.volumeInfo?.description != null &&
              controller.book.value.volumeInfo!.description!.isNotEmpty)
            const BookDescription(),
          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: DefaultButton(
              elevation: 0,
              horizontalPadding: Get.width * 0.4,
              onPressed: () => Get.back(),
              executeWhenNoInternet: true,
              text: 'BACK',
              textSize: 12,
              textColor: Colors.black,
              backgroundColor: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
