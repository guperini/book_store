import 'package:dartz/dartz.dart';

import '../../core/errors/http_errors.dart';
import 'book_entity.dart';
import 'book_repository.dart';

abstract class GetFavoriteBookUsecase {
  Future<Either<HttpError, BookEntity>> call(
    String selfLinkId,
  );
}

class GetFavoriteBookUsecaseImp implements GetFavoriteBookUsecase {
  final BookRepository bookRepository;
  GetFavoriteBookUsecaseImp(this.bookRepository);

  @override
  Future<Either<HttpError, BookEntity>> call(String selfLinkId) async {
    return await bookRepository.getFavoriteBook(selfLinkId);
  }
}
