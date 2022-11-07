import 'package:book_store/core/app/app_binding.dart';
import 'package:book_store/core/app/app_routes.dart';
import 'package:book_store/core/constants/constants.dart';
import 'package:book_store/core/constants/theme_data.dart';
import 'package:book_store/data/book/book_repository_imp.dart';
import 'package:book_store/infra/adapters/http_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:mocktail/mocktail.dart';

class HttpAdapterMock extends Mock implements HttpAdapter {}

class BookRepositoryMock extends Mock implements BookRepositoryImp {}

void main() {
  Widget createWidgetUnderTest() {
    return GetMaterialApp(
      title: Constants.appTitle,
      theme: themeData,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      initialRoute: Routes.initial,
      getPages: AppRoutes.routes,
      initialBinding: AppBinding(),
    );
  }

  testWidgets(
    '11 tests to ensure all the functions are working fine',
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.pumpAndSettle();

      expect(find.text('Book Store'), findsOneWidget);

      await tester.tap(find.text('GO TO STORE'));

      await tester.pumpAndSettle();

      expect(find.text('My favorite books  '), findsOneWidget);

      expect(find.byKey(const Key('q9MsAwAAQBAJ')), findsOneWidget);

      await tester.tap(find.byKey(const Key('q9MsAwAAQBAJ')));

      await tester.pumpAndSettle();

      expect(find.text('Author: '), findsOneWidget);

      expect(find.text('iOS App Development For Dummies'), findsOneWidget);

      expect(find.text('FAVORITE   '), findsOneWidget);

      expect(find.byKey(const Key('BUY')), findsOneWidget);

      expect(find.byKey(const Key('GO BACK')), findsOneWidget);

      await tester.tap(find.text('FAVORITE   '));

      await tester.tap(find.byKey(const Key('GO BACK')));

      await tester.pumpAndSettle();

      await tester.tap(find.text('My favorite books  '));

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('q9MsAwAAQBAJ')), findsOneWidget);

      await tester.tap(find.byKey(const Key('q9MsAwAAQBAJ')));

      await tester.pumpAndSettle();

      await tester.tap(find.text('FAVORITE   '));

      await tester.tap(find.byKey(const Key('GO BACK')));

      await tester.pumpAndSettle();

      expect(find.text('No books to show!'), findsOneWidget);

      await tester.tap(find.text('My favorite books  '));

      await tester.pumpAndSettle();

      await tester.drag(find.byKey(const Key('GridKey')), const Offset(0.0, -7000));

      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 1));

      await tester.drag(find.byKey(const Key('GridKey')), const Offset(0.0, -300));

      await Future.delayed(const Duration(seconds: 2));

      // Temporary test. Find the book id:su4lDQAAQBAJ
      expect(find.byKey(const Key('su4lDQAAQBAJ')), findsOneWidget);
    },
  );
}
