import 'package:flutter/material.dart';

import '../../../domain/book/book_entity.dart';
import 'package:get/get.dart';
import '../../../core/app/app_controller.dart';
import '../store/store_controller.dart';

class BookDetailsController extends GetxController {
  final AppController appController;
  Rx<BookEntity> book = Get.arguments;

  BookDetailsController(this.appController);

  // controllers
  final scrollController = ScrollController();

  // lists

  // variáveis observáveis
  RxBool isFavorite = false.obs;

  // getters and setters

  List<String> get authors => book.value.volumeInfo!.authors ?? [];

  // methods

  @override
  void onInit() {
    isFavorite.value = book.value.isFavorite;
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  onPressedFavoriteButton() {
    Get.find<StoreController>().toogleFavoriteBook(book.value);
    isFavorite.value = !isFavorite.value;
  }

  String getAuthorsString() {
    final list = book.value.volumeInfo!.authors;
    String authors = '';

    if (list != null && list.isNotEmpty) {
      for (final author in list) {
        if (list.indexOf(author) != list.length - 1) {
          authors += '$author, ';
        } else {
          authors += '$author.';
        }
      }
    }

    return authors;
  }
}
