import 'package:book_store/presenter/pages/store/store_binding.dart';
import 'package:book_store/presenter/pages/store/store_view.dart';
import 'package:get/get.dart';

import '../../presenter/pages/book_details/book_details_binding.dart';
import '../../presenter/pages/book_details/book_details_view.dart';
import '../../presenter/pages/splash/splash_binding.dart';
import '../../presenter/pages/splash/splash_view.dart';

abstract class Routes {
  static const initial = '/';
  static const store = '/store';
  static const bookDetails = '/bookDetails';
}

// ignore: avoid_classes_with_only_static_members
abstract class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashView(),
      transition: Transition.native,
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: Routes.store,
      page: () => const StoreView(),
      transition: Transition.native,
      bindings: [StoreBinding()],
    ),
    GetPage(
      name: Routes.bookDetails,
      page: () => const BookDetailsView(),
      transition: Transition.native,
      binding: BookDetailsBinding(),
    ),
  ];
}
