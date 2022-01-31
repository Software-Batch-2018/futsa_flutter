import "package:flutter/material.dart";
import 'package:get/get.dart';

class MainPageController extends GetxController {
  var currentIndex = 0.obs;

  final controller = PageController();

  void onNavbottomChange(index) {
    currentIndex.value = index;
    controller.jumpToPage(currentIndex.value);
  }

  final List<Widget> navItems = [
    Text("Page 1"),
    Text("Page 2"),
    Text("Page 3"),
    Text("Page 4"),
  ];
}
