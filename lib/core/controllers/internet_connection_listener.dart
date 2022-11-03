import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../presenter/widgets/dialogs/custom_snackbar.dart';

class InternetConnectionListener extends GetxController {
  final RxBool isConnected = true.obs;

  StreamSubscription<InternetConnectionStatus>? connectionListener;

  @override
  void onInit() {
    connectionListener = _initConnectionListener();
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
      "Conexão de Internet",
      "Oops, parece que vc está sem internet",
    );
  }
}
