import 'package:dartz/dartz.dart';

import 'book_entity.dart';
import 'book_repository.dart';

abstract class GetFavoriteBookUseCase {
  Future<Either<Exception, BookEntity>> call(
    String selfLinkId,
  );
}

class GetFavoriteBookUseCaseImp implements GetFavoriteBookUseCase {
  final BookRepository bookRepository;
  GetFavoriteBookUseCaseImp(this.bookRepository);

  @override
  Future<Either<Exception, BookEntity>> call(String selfLinkId) async {
    return await bookRepository.getFavoriteBook(selfLinkId);
  }
}
