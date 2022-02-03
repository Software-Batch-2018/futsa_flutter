import 'package:get/get.dart';

class AuthController extends GetxController {
  var isAuth = false.obs;

  void toogleAuthStatus() {
    isAuth.value = !isAuth.value;
    Get.toNamed('/main');
  }

  get isAuthenticated => isAuth.value;
}
