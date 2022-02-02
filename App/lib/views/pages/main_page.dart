import 'package:flutter/material.dart';
import 'package:futsa/controllers/auth_controller.dart';
import 'package:futsa/controllers/main_page_controller.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainPageController _mainPageController = MainPageController();
  AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            onTap: (index) {
              print("From main page");

              print(_authController.isAuth.value);
              _mainPageController.onNavbottomChange(index);
            },
            currentIndex: _mainPageController.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  title: Text('Explore'), icon: Icon(Icons.explore)),
              BottomNavigationBarItem(
                title: Text('Community'),
                icon: Icon(Icons.forum),
              ),
              BottomNavigationBarItem(
                title: Text('Notifications'),
                icon: Icon(Icons.notifications),
              ),
              BottomNavigationBarItem(
                title: Text('Profile'),
                icon: Icon(Icons.account_circle),
              ),
            ],
          ),
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _mainPageController.navItems[index],
                ],
              );
            },
            itemCount: _mainPageController.navItems.length,
            onPageChanged: _mainPageController.currentIndex,
            controller: _mainPageController.controller,
          ),
        ),
      ),
    );
  }
}
