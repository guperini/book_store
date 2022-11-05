import 'package:book_store/core/constants/endpoints.dart';
import 'package:book_store/infra/adapters/http_adapter.dart';
import 'package:book_store/infra/adapters/http_adapter_imp.dart';
import 'package:dartz/dartz.dart';

import '../../domain/book/book_entity.dart';
import '../../domain/book/book_repository.dart';
import 'book_dto.dart';

class BookRepositoryImp implements BookRepository {
  final HttpAdapter httpAdapter;

  BookRepositoryImp(this.httpAdapter);

  @override
  Future<Either<Exception, List<BookEntity>>> searchBooks(String searchText, int startIndex, int maxResults) async {
    try {
      final Map<String, dynamic> response = await httpAdapter.request(
          method: HttpMethod.get,
          endpoint: Endpoints.searchBooks,
          queryParameters: {"q": searchText, "maxResults": maxResults, "startIndex": startIndex});

      final list = List<Map<String, dynamic>>.from(response['items']);

      final books = <BookEntity>[];

      for (final item in list) {
        books.add(Book.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, BookEntity>> getFavoriteBook(String selfLinkId) async {
    try {
      final Map<String, dynamic> response = await httpAdapter.request(
        method: HttpMethod.get,
        endpoint: selfLinkId,
      );

      final result = Map<String, dynamic>.from(response);

      return Right(Book.fromJson(result));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
