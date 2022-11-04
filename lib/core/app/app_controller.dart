import 'dart:async';
import 'dart:io';

import 'package:book_store/core/controllers/internet_connection_listener.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';

class AppController extends GetxController {
  final InternetConnectionListener internetConnectionListener;

  AppController(
    this.internetConnectionListener,
  );

  @override
  void onInit() {
    _initHive();

    super.onInit();
  }

  _initHive() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocDir.path);

    Hive.openBox<bool>('favoriteBooks');
  }

  // variables
  static bool producao = const bool.fromEnvironment("production");
  static String versaoDoApp = "0.0.2";
  StreamSubscription<InternetConnectionStatus>? listener;

  // getters
  Rx<bool> get isConnected => internetConnectionListener.isConnected;

  @override
  void onClose() {
    if (listener != null) {
      listener!.cancel();
    }
    super.onClose();
  }
}
