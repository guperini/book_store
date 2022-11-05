import 'package:book_store/core/constants/endpoints.dart';
import 'package:book_store/infra/adapters/http_adapter.dart';
import 'package:book_store/infra/adapters/http_adapter_imp.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/http_errors.dart';
import '../../domain/book/book_entity.dart';
import '../../domain/book/book_repository.dart';
import 'book_dto.dart';

class BookRepositoryImp implements BookRepository {
  final HttpAdapter httpAdapter;

  BookRepositoryImp(this.httpAdapter);

  @override
  Future<Either<HttpError, List<BookEntity>>> searchBooks(String searchText, int startIndex, int maxResults) async {
    try {
      final Map<String, dynamic> response = await httpAdapter.request(
          method: HttpMethod.get,
          endpoint: Endpoints.searchBooks,
          queryParameters: {"q": searchText, "maxResults": maxResults, "startIndex": startIndex});

      final list = response['items'] != null ? List<Map<String, dynamic>>.from(response['items']) : [];

      final books = <BookEntity>[];

      for (final item in list) {
        books.add(Book.fromJson(item));
      }
      return Right(books);
    } on HttpError catch (httpError) {
      return Left(httpError);
    } catch (e) {
      return Left(HttpError(e.toString()));
    }
  }

  @override
  Future<Either<HttpError, BookEntity>> getFavoriteBook(String selfLinkId) async {
    try {
      final Map<String, dynamic> response = await httpAdapter.request(
        method: HttpMethod.get,
        endpoint: selfLinkId,
      );

      final result = Map<String, dynamic>.from(response);

      return Right(Book.fromJson(result));
    } on HttpError catch (httpError) {
      return Left(httpError);
    } catch (e) {
      return Left(HttpError(e.toString()));
    }
  }
}
