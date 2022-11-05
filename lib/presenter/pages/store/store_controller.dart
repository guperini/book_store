import 'package:book_store/domain/book/book_entity.dart';
import 'package:book_store/domain/book/search_books_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../core/app/app_controller.dart';
import '../../../domain/book/get_favorite_book_usecase.dart';

class StoreController extends GetxController {
  final AppController appController;
  final SearchBooksUseCase searchBooksUseCaseImp;
  final GetFavoriteBookUseCase getFavoriteBookUseCaseImp;

  StoreController(this.appController, this.searchBooksUseCaseImp, this.getFavoriteBookUseCaseImp);

  final box = Hive.box<String>('favoriteBooks');

  // arguments

  // controllers

  final scrollController = ScrollController();

  // listas

  final allBooks = <BookEntity>[].obs;
  final favoriteBooks = <BookEntity>[].obs;
  List<BookEntity> get booksToShow => showOnlyFavoriteBooks.value ? favoriteBooks : allBooks;

  // observables

  final isloading = false.obs;
  final showOnlyFavoriteBooks = false.obs;

  // métodos

  @override
  void onInit() {
    _getBooks();
    _getFavoriteBooks();
    _initScrollControllerListener();
    super.onInit();
  }

  _initScrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        _getBooks();
      }
    });
  }

  onlyFavoriteBooks() async {
    showOnlyFavoriteBooks.toggle();

    isloading.value = true;

    isloading.value = false;
  }

  _getFavoriteBooks() async {
    favoriteBooks.assignAll([]);

    final favoritesKeys = List<String>.from(box.keys);

    for (final key in favoritesKeys) {
      final value = box.get(key);

      if (value != null) {
        final result = await getFavoriteBookUseCaseImp.call(value);
        // ignore: avoid_print
        result.fold((l) => print("Error: $l"), (r) => favoriteBooks.add(r..isFavorite = true));
      }
    }
  }

  toogleFavoriteBook(BookEntity book) {
    final result = box.get(book.id);

    int? index;

    if (allBooks.contains(book)) {
      index = allBooks.indexOf(book);
    }

    if (result == null) {
      box.put(book.id, book.selfLink!);

      allBooks[index!] = book..isFavorite = true;
      favoriteBooks.add(book);
    } else {
      if (index != null) {
        allBooks[index] = book..isFavorite = false;
      }

      if (favoriteBooks.where((p0) => p0.id == book.id).toList().isNotEmpty) {
        final item = favoriteBooks.where((p0) => p0.id == book.id).toList()[0];
        final favoriteIndex = favoriteBooks.indexOf(item);
        favoriteBooks.removeAt(favoriteIndex);
      }

      box.delete(
        book.id,
      );
    }
  }

  bool isBookFavorite(String id) {
    final result = box.get(id);

    if (result == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> _getBooks() async {
    isloading.value = true;
    final result = await searchBooksUseCaseImp.call('mobile development', allBooks.length, 20);

    result.fold((l) {
      // ignore: avoid_print
      print(l.toString());
    }, (r) {
      if (r.isNotEmpty) {
        allBooks.addAll(r);
      }
    });

    isloading.value = false;
  }
}
