import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  final _hasInternet = false.obs;
  final _text = ''.obs;

  set hasInternet(val) => _hasInternet.value = val;

  set text(val) => _text.value = val;

  get hasInternet => _hasInternet.value;

  get text => _text.value;

  Future<bool> checkInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
