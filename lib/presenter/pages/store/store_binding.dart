import '../../../data/book/book_repository_imp.dart';
import '../../../domain/book/book_repository.dart';
import '../../../domain/book/get_favorite_book_usecase.dart';
import '../../../infra/adapters/http_adapter.dart';
import '../../../infra/adapters/http_adapter_imp.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../core/app/app_controller.dart';
import '../../../core/controllers/internet_connection_listener.dart';
import '../../../domain/book/search_books_usecase.dart';
import 'store_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    // DataSources and Adapters

    Get.lazyPut<HttpAdapter>(() => HttpAdapterImp(Client()));

    // Repositories

    Get.lazyPut<BookRepository>(() => BookRepositoryImp(Get.find()));

    // Usecases

    Get.lazyPut<SearchBooksUsecase>(() => SearchBooksUsecaseImp(Get.find()));
    Get.lazyPut<GetFavoriteBookUsecase>(() => GetFavoriteBookUsecaseImp(Get.find()));

    // Controllers

    Get.lazyPut(() => InternetConnectionListener());
    Get.lazyPut(() => AppController(Get.find()));
    Get.put(StoreController(Get.find(), Get.find(), Get.find()));
  }
}
