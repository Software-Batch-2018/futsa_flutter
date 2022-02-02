import 'package:get/get.dart';

class AuthController extends GetxController {
  final isAuth = false.obs;

  var isAuthin1and0 = 0.obs;

  void toogleAuthStatus() {
    isAuth.value = !isAuth.value;
    Get.toNamed('/main');
    print(isAuth.value);
  }

  get isAuthenticated => isAuth.value;
}
