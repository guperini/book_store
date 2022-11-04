import 'package:book_store/core/constants/endpoints.dart';
import 'package:book_store/infra/adapters/http_adapter.dart';
import 'package:book_store/infra/adapters/http_adapter_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../domain/book/book_entity.dart';
import '../../domain/book/book_repository.dart';
import 'book_dto.dart';

class BookRepositoryImp implements BookRepository {
  final HttpAdapter httpAdapter;

  BookRepositoryImp(this.httpAdapter);

  @override
  Future<Either<Exception, List<BookEntity>>> searchBooks(String searchText, int startIndex, int maxResults) async {
    final box = Hive.box<bool>('favoriteBooks');
    try {
      final Map<String, dynamic> response = await httpAdapter.request(
          method: HttpMethod.get,
          endpoint: Endpoints.searchBooks,
          queryParameters: {"q": searchText, "maxResults": maxResults, "startIndex": startIndex});

      final list = List<Map<String, dynamic>>.from(response['items']);

      final books = <BookEntity>[];

      for (final item in list) {
        final book = Book.fromJson(item);
        final isFavorite = box.get(book.id) ?? false;
        books.add(Book.fromJson(item)..isFavorite = isFavorite);
      }
      return Right(books);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
