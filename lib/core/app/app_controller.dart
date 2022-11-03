import 'dart:async';

import 'package:book_store/core/controllers/internet_connection_listener.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppController extends GetxController {
  final InternetConnectionListener internetConnectionListener;

  AppController(
    this.internetConnectionListener,
  );

  // variables
  static bool producao = const bool.fromEnvironment("production");
  static String versaoDoApp = "0.0.2";
  StreamSubscription<InternetConnectionStatus>? listener;

  // getters
  RxBool get isConnected => internetConnectionListener.isConnected;

  @override
  void onClose() {
    if (listener != null) {
      listener!.cancel();
    }
    super.onClose();
  }
}
