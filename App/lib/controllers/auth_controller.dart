import 'package:futsa/views/pages/main_page.dart';
import 'package:futsa/views/pages/profile_page.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isAuth = false.obs;

  void toogleAuthStatus() {
    isAuth.value = !isAuth.value;
    Get.toNamed('/main');
    print(isAuth.value);
  }

  get isAuthenticated => isAuth.value;
}
