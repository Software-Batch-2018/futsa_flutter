import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FutsalsTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Near you'),
    const Tab(text: 'Saved places'),
  ];

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: myTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }
}
