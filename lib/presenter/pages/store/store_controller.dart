import 'package:book_store/domain/book/book_entity.dart';
import 'package:book_store/domain/book/search_books_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../core/app/app_controller.dart';

class StoreController extends GetxController {
  final AppController appController;
  final SearchBooksUseCase searchBooksUseCaseImp;

  StoreController(this.appController, this.searchBooksUseCaseImp);

  @override
  void onInit() {
    _getBooks();
    _initScrollControllerListener();
    super.onInit();
  }

  final box = Hive.box<bool>('favoriteBooks');

  // arguments

  // controllers

  final scrollController = ScrollController();

  // listas

  final allBooks = <BookEntity>[].obs;
  List<BookEntity> get favoriteBooks => allBooks.where((p0) => box.get(p0.id) != null && box.get(p0.id)!).toList().obs;
  List<BookEntity> get booksToShow => showOnlyFavoriteBooks.value ? favoriteBooks : allBooks;

  // variáveis observáveis

  final isloading = false.obs;
  final showOnlyFavoriteBooks = true.obs;

  // getters e setters

  // métodos

  _initScrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        _getBooks();
      }
    });
  }

  toogleFavoriteBook(String id) {
    final result = box.get(id);

    if (result == null || !result) {
      box.put(id, true);
      allBooks.where((p0) => p0.id == id).toList()[0].isFavorite = true;
    } else {
      box.put(id, false);
      allBooks.where((p0) => p0.id == id).toList()[0].isFavorite = false;
    }
  }

  Future<void> _getBooks() async {
    isloading.value = true;
    final result = await searchBooksUseCaseImp.call('mobile development', allBooks.length, 20);

    result.fold((l) {
      print(l.toString());
    }, (r) {
      if (r.isNotEmpty) {
        allBooks.addAll(r);
      }
    });

    isloading.value = false;
  }
}
