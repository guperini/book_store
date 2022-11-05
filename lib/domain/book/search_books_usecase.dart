import 'package:dartz/dartz.dart';

import '../../core/errors/http_errors.dart';
import 'book_entity.dart';
import 'book_repository.dart';

abstract class SearchBooksUsecase {
  Future<Either<HttpError, List<BookEntity>>> call(String searchText, int startIndex, int maxResults);
}

class SearchBooksUsecaseImp implements SearchBooksUsecase {
  final BookRepository bookRepository;
  SearchBooksUsecaseImp(this.bookRepository);

  @override
  Future<Either<HttpError, List<BookEntity>>> call(String searchText, int startIndex, int maxResults) async {
    return await bookRepository.searchBooks(searchText, startIndex, maxResults);
  }
}
