import "package:flutter/material.dart";
import 'package:futsa/views/widgets/global_styles.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              //Hero Part
              Row(
                children: [
                  const Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Futsa",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(right: 15, top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/futsal.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ABC Futsal Pokhara",
                              style: _stackText(),
                            ),
                            Text(
                              "Nadipur Pokhara",
                              style: _stackText().merge(
                                const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            'Book now',
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              // Futsal near you container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Futsals near you",
                    style: _stackText().merge(
                      const TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed('/allfutsals');
                      },
                      child: const Text("See all")),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 180,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return DetailsCard();
                    }),
              ),

              //   Upcoming events
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Events",
                    style: _stackText().merge(
                      const TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all")),
                ],
              ),
              //add more topics here
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/futsal.jpg',
            scale: 4,
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                    Random().nextInt(4) + 1,
                    (index) => const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        )),
              ),
              Text(
                "ABC Futsal",
                style: _stackText().merge(const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal)),
              ),
              Text(
                "Nadipur pokhara",
                style: GlobalStyles().subHeaderTextStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

TextStyle _stackText() {
  return GoogleFonts.openSans(
      textStyle: const TextStyle(
    fontSize: 24,
    color: Colors.white70,
    fontWeight: FontWeight.bold,
  ));
}
