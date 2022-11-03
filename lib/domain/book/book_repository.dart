import 'package:dartz/dartz.dart';

import 'book_entity.dart';

abstract class BookRepository {
  Future<Either<Exception, List<BookEntity>>> searchBooks(String searchText);
}

// BINDING:
//     Get.lazyPut<BookRepository>(
//      () => BookRepositoryImp());

    