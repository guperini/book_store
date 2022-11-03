import 'package:book_store/data/book/book_dto.dart';
import 'package:dartz/dartz.dart';

import 'book_entity.dart';
import 'book_repository.dart';

abstract class SearchBooksUseCase {
  Future<Either<Exception, List<BookEntity>>> call(String searchText);
}

class SearchBooksUseCaseImp implements SearchBooksUseCase {
  final BookRepository bookRepository;
  SearchBooksUseCaseImp(this.bookRepository);

  @override
  Future<Either<Exception, List<BookEntity>>> call(String searchText) async {
    return bookRepository.searchBooks(searchText);
  }
}

// BINDING:
//     Get.lazyPut<SearchBooksUseCase>(
//      () => SearchBooksUseCaseImp(Get.find()));