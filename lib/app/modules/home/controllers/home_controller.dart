import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  late StreamSubscription subscription, internetSubscription;

  final _hasInternet = false.obs;
  final _text = ''.obs;

  set hasInternet(val) => _hasInternet.value = val;

  set text(val) => _text.value = val;

  get hasInternet => _hasInternet.value;

  get text => _text.value;

  ConnectivityResult connectivityResult = ConnectivityResult.none;

  Future<bool> checkInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }

  @override
  void onInit() {
    super.onInit();

    subscription = Connectivity().onConnectivityChanged.listen((result) {
      connectivityResult = result;
    });

    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      hasInternet = status == InternetConnectionStatus.connected;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    subscription.cancel();
    internetSubscription.cancel();
    super.dispose();
  }
}
