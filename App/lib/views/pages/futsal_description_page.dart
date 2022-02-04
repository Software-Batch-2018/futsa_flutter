import 'dart:math';

import 'package:flutter/material.dart';
import 'package:futsa/controllers/image_carousel_controller.dart';
import 'package:futsa/views/widgets/global_styles.dart';
import 'package:get/get.dart';

class FutsalDescription extends StatelessWidget {
  FutsalDescription({Key? key}) : super(key: key);

  final _carouselController = Get.put(ImageCarouselController());
  final _globalStyles = GlobalStyles();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                height: 230,
                child: PageView.builder(
                  onPageChanged: _carouselController.selectedImage,
                  itemBuilder: (_, i) {
                    return Image.asset(
                      'assets/images/futsal.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: _carouselController.carouselimages.length,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.bookmark_add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 15,
                left: MediaQuery.of(context).size.width / 3,
                child: Row(
                  children: List.generate(
                      _carouselController.carouselimages.length,
                      (index) => Obx(
                            () => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      _carouselController.selectedImage.value ==
                                              index
                                          ? Colors.white54
                                          : Colors.white12,
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ]),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ABC futsal pvt. Ltd',
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
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
                                    ' Nadipur, Pokhara',
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
                                children: const [
                                  Icon(
                                    Icons.call,
                                    size: 13,
                                    color: Colors.black45,
                                  ),
                                  Text(
                                    ' 9846168323',
                                    style: TextStyle(
                                        fontSize: 13,
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
                                " Rs: 1200 /hrs",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.favorite_border,
                            size: 35,
                            color: Colors.teal,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _globalStyles.menuBox(
                            'Bookings',
                            Icons.data_usage,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          _globalStyles.menuBox(
                            'Reviews',
                            Icons.comment,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          _globalStyles.menuBox(
                            'Events',
                            Icons.event,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // TODO : Create a different controller for the blogs to show here.
            Expanded(
              child: Card(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    itemBuilder: (_, index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.rss_feed,
                              ),
                              title: Text(
                                "What is Lorem Ipsum?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              subtitle: Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry....'),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
