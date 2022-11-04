import 'package:book_store/data/book/book_repository_imp.dart';
import 'package:book_store/domain/book/book_entity.dart';

import 'package:book_store/domain/book/search_books_usecase.dart';
import 'package:book_store/infra/adapters/http_adapter.dart';
import 'package:book_store/infra/adapters/http_adapter_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class HttpAdapterMock extends Mock implements HttpAdapter {}

class BookRepositoryMock extends Mock implements BookRepositoryImp {}

void main() {
  test('search books returns right list books', () async {
    final httpAdapter = HttpAdapterImp(Client());
    final repository = BookRepositoryImp(httpAdapter);
    final sut = SearchBooksUseCaseImp(repository);

    //ARRANGE
    const searchText = 'mobile development';

    //ACT
    final result = await sut.call(searchText, 0, 20);

    //ASSERT

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<BookEntity>>());
  });
  test('verify if repository is called once', () async {
    final repositoryMock = BookRepositoryMock();
    final sutMock = SearchBooksUseCaseImp(repositoryMock);

    //ARRANGE
    const searchText = 'mobile development';
    when(() => repositoryMock.searchBooks(searchText, 0, 20)).thenAnswer(
      (_) async => const Right(<BookEntity>[]),
    );

    //ACT
    final result = await sutMock.call(searchText, 0, 20);

    //ASSERT
    verify(() => repositoryMock.searchBooks(searchText, 0, 20)).called(1);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<BookEntity>>());
  });
}
