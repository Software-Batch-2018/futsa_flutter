import 'dart:math';
import 'package:flutter/material.dart';
import 'package:futsa/views/pages/futsal_description_page.dart';
import 'package:get/get.dart';

class FutsalsTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Near you'),
    const Tab(text: 'Saved places'),
  ];

  final List<Widget> myTabViews = [
    const TabContent(),
    const TabContent(),
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

class TabContent extends StatelessWidget {
  const TabContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          10,
          (index) {
            return const FutsalCard();
          },
        ),
      ),
    );
  }
}

class FutsalCard extends StatelessWidget {
  const FutsalCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/futsal.jpg',
              scale: 3.5,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ABC Futsal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.location_on,
                    size: 15,
                    color: Colors.black45,
                  ),
                  Text(
                    'Nadipur, Pokhara',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: List.generate(
                    Random().nextInt(4) + 1,
                    (index) => const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        )),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                'Rs:1200 /hrs',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          IconButton(
              onPressed: () {
                Get.to(FutsalDescription());
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.teal,
              ))
        ],
      ),
    ));
  }
}
