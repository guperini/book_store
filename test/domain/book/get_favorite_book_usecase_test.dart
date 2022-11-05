import 'package:book_store/core/errors/http_errors.dart';
import 'package:book_store/data/book/book_repository_imp.dart';
import 'package:book_store/domain/book/book_entity.dart';
import 'package:book_store/domain/book/get_favorite_book_usecase.dart';

import 'package:book_store/infra/adapters/http_adapter.dart';
import 'package:book_store/infra/adapters/http_adapter_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class HttpAdapterMock extends Mock implements HttpAdapter {}

class BookRepositoryMock extends Mock implements BookRepositoryImp {}

void main() {
  final httpAdapter = HttpAdapterImp(Client());
  final repository = BookRepositoryImp(httpAdapter);
  final sut = GetFavoriteBookUsecaseImp(repository);
  const selfLink = "https://www.googleapis.com/books/v1/volumes/t1PijeoVwcAC";

  final repositoryMock = BookRepositoryMock();
  final sutMock = GetFavoriteBookUsecaseImp(repositoryMock);

  test('get favorite returns right list books', () async {
    //ACT
    final result = await sut.call(selfLink);

    //ASSERT

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<BookEntity>());
  });
  test('verify if repository is called once', () async {
    //ARRANGE

    when(() => repositoryMock.getFavoriteBook(selfLink)).thenAnswer(
      (_) async => Right(BookEntity()),
    );

    //ACT
    final result = await sutMock.call(selfLink);

    //ASSERT
    verify(() => repositoryMock.getFavoriteBook(
          selfLink,
        )).called(1);
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<BookEntity>());
  });

  test('correct return when http error', () async {
    //ARRANGE

    when(() => repositoryMock.getFavoriteBook(selfLink)).thenAnswer(
      (_) async => Left(HttpError('erro')),
    );

    //ACT
    final result = await sutMock.call(
      selfLink,
    );

    //ASSERT
    verify(() => repositoryMock.getFavoriteBook(selfLink)).called(1);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<HttpError>());
  });
}
