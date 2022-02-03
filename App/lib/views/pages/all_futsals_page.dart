import 'dart:math';

import 'package:flutter/material.dart';
import 'package:futsa/controllers/futsal_tabs_controller.dart';
import 'package:futsa/views/pages/futsal_description_page.dart';
import 'package:get/get.dart';

class AllFutsalsPage extends StatelessWidget {
  AllFutsalsPage({Key? key}) : super(key: key);

  final _futsalController = Get.put(FutsalsTabController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.location_on,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Pokhara'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => {Get.back()},
                  ),
                ],
              ),
            ),
            // search box
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Search by name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            //Tabs style
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [
                  TabBar(
                    controller: _futsalController.tabController,
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    tabs: _futsalController.myTabs,
                  ),
                  // Tab contents
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: TabBarView(
                      controller: _futsalController.tabController,
                      children: _futsalController.myTabViews
                          .map((content) => content)
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
