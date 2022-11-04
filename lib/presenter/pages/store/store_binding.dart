import 'package:book_store/data/book/book_repository_imp.dart';
import 'package:book_store/domain/book/book_repository.dart';
import 'package:book_store/infra/adapters/http_adapter.dart';
import 'package:book_store/infra/adapters/http_adapter_imp.dart';
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

    Get.lazyPut<SearchBooksUseCase>(() => SearchBooksUseCaseImp(Get.find()));

    // Controllers

    Get.lazyPut(() => InternetConnectionListener());
    Get.lazyPut(() => AppController(Get.find()));
    Get.put(StoreController(Get.find(), Get.find()));
  }
}
