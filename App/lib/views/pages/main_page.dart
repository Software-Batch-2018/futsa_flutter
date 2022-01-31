import 'package:flutter/material.dart';
import 'package:futsa/controllers/main_page_controller.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainPageController _mainPageController = MainPageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            onTap: (index) {
              _mainPageController.onNavbottomChange(index);
            },
            currentIndex: _mainPageController.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  title: Text('Home'), icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                title: Text('Music'),
                icon: Icon(Icons.music_note),
              ),
              BottomNavigationBarItem(
                title: Text('Places'),
                icon: Icon(Icons.location_on),
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
            itemCount: 4,
            onPageChanged: _mainPageController.currentIndex,
            controller: _mainPageController.controller,
          ),
        ),
      ),
    );
  }
}
