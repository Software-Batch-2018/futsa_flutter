import "package:flutter/material.dart";
import 'package:futsa/views/pages/community_page.dart';
import 'package:futsa/views/pages/explore_page.dart';
import 'package:futsa/views/pages/notifications_page.dart';
import 'package:futsa/views/pages/profile_page.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  var currentIndex = 0.obs;

  final controller = PageController();

  void onNavbottomChange(index) {
    currentIndex.value = index;
    controller.jumpToPage(currentIndex.value);
  }

  final List<Widget> navItems = [
    ExplorePage(),
    const CommunityPage(),
    const NotificationPage(),
    ProfilePage(),
  ];
}
