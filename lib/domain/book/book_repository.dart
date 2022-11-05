import 'package:dartz/dartz.dart';

import '../../core/errors/http_errors.dart';
import 'book_entity.dart';

abstract class BookRepository {
  Future<Either<HttpError, List<BookEntity>>> searchBooks(String searchText, int startIndex, int maxResults);
  Future<Either<HttpError, BookEntity>> getFavoriteBook(String selfLinkId);
}
