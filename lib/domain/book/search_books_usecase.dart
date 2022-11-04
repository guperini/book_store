import 'package:dartz/dartz.dart';

import 'book_entity.dart';
import 'book_repository.dart';

abstract class SearchBooksUseCase {
  Future<Either<Exception, List<BookEntity>>> call(String searchText, int startIndex, int maxResults);
}

class SearchBooksUseCaseImp implements SearchBooksUseCase {
  final BookRepository bookRepository;
  SearchBooksUseCaseImp(this.bookRepository);

  @override
  Future<Either<Exception, List<BookEntity>>> call(String searchText, int startIndex, int maxResults) async {
    return await bookRepository.searchBooks(searchText, startIndex, maxResults);
  }
}
