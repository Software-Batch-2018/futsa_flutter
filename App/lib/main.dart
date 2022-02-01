import "package:flutter/material.dart";
import "package:get/get.dart";
import './theme_data.dart';
import './views/pages/location_page.dart';
import './views/pages/home_page.dart';
import './views/pages/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      themeMode: ThemeMode.light,
      getPages: [
        GetPage(name: "/", page: () => Homepage()),
        GetPage(name: "/location", page: () => LocationPage()),
        GetPage(name: "/main", page: () => MainPage()),
      ],
    );
  }
}
