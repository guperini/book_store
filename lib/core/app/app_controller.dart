import 'dart:io';

import '../controllers/internet_connection_listener.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppController extends GetxController {
  final InternetConnectionListener internetConnectionListener;

  AppController(
    this.internetConnectionListener,
  );

  // getters
  Rx<bool> get isConnected => internetConnectionListener.isConnected;

  // methods
  @override
  void onInit() {
    _initHive();

    super.onInit();
  }

  _initHive() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocDir.path);

    Hive.openBox<String>('favoriteBooks');
  }
}
