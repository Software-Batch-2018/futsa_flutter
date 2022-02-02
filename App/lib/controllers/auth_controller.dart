import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isAuth = false.obs;

  void toogleAuthStatus() {
    isAuth.value = !isAuth.value;
    Get.toNamed('/main');
    print(isAuth.value);
  }
}
