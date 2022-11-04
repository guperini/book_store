import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../presenter/widgets/custom_snackbar.dart';

class InternetConnectionListener extends GetxController {
  final isConnected = true.obs;

  StreamSubscription<InternetConnectionStatus>? connectionListener;

  @override
  void onInit() {
    if (!kIsWeb) {
      connectionListener = _initConnectionListener();
    }

    super.onInit();
  }

  @override
  void onClose() {
    if (connectionListener != null) {
      connectionListener!.cancel();
    }
    super.onClose();
  }

  _initConnectionListener() => InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) {
          switch (status) {
            case InternetConnectionStatus.connected:
              isConnected.value = true;

              break;
            case InternetConnectionStatus.disconnected:
              isConnected.value = false;
              showNoInternetSnackbar();

              break;
          }
        },
      );
  showNoInternetSnackbar() {
    return CustomSnackbar.call(
      "Internet Connection",
      "Oops, no Internet Connection buddy...",
    );
  }
}
