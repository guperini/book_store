import 'package:book_store/data/book/book_repository_imp.dart';
import 'package:book_store/domain/book/book_entity.dart';
import 'package:book_store/domain/book/book_repository.dart';
import 'package:book_store/domain/book/search_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BookRepositoryMock extends Mock implements BookRepository {}

void main() {
  test('search books usecase ...', () async {
    final repository = BookRepositoryImp();
    final sut = SearchBooksUseCaseImp(repository);

    //ARRANGE
    const searchText = 'mobile development';

    //ACT
    final result = await sut.call(searchText);

    result.fold((l) => null, (r) {
      print(r.runtimeType);
      print(r.toString());
    });

    //ASSERT
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<BookEntity>>());
  });
}
