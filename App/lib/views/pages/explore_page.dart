import "package:flutter/material.dart";
import 'package:futsa/controllers/futsals_controller.dart';
import 'package:futsa/views/widgets/futsal_box_card.dart';
import 'package:futsa/views/widgets/futsal_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);

  final scrollController = ScrollController();
  final _futsalsController = FutsalsController();

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
              SizedBox(
                height: 175,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _futsalsController.futsals.length,
                    itemBuilder: (_, index) {
                      return FutsalBoxCard(
                        id: _futsalsController.futsals[index].id,
                        futsalName:
                            _futsalsController.futsals[index].futsalName,
                        address: _futsalsController.futsals[index].address,
                        imageLink: _futsalsController.futsals[index].imageLink,
                        pricePerHour:
                            _futsalsController.futsals[index].pricePerHour,
                      );
                    }),
              ),
              //   Recommended futsals for you.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  _futsalsController.futsals.length,
                  (index) {
                    return FutsalCard(
                      id: _futsalsController.futsals[index].id,
                      futsalName: _futsalsController.futsals[index].futsalName,
                      address: _futsalsController.futsals[index].address,
                      imageLink: _futsalsController.futsals[index].imageLink,
                      pricePerHour:
                          _futsalsController.futsals[index].pricePerHour,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle _stackText() {
  return const TextStyle(
    fontSize: 24,
    color: Colors.white70,
    fontWeight: FontWeight.bold,
  );
}
