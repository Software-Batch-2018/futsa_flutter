import "package:flutter/material.dart";
import 'package:futsa/views/widgets/global_styles.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageController extends GetxController {
  var currentIndex = 0.obs;

  final controller = PageController();

  void onNavbottomChange(index) {
    currentIndex.value = index;
    controller.jumpToPage(currentIndex.value);
  }

  final List<Widget> navItems = [
    ExplorePage(),
    Text("Page 2"),
    Text("Page 3"),
    Text("Page 4"),
  ];
}

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
          margin: const EdgeInsets.only(left: 30, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
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
              SizedBox(
                height: 15,
              ),
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
                  TextButton(onPressed: () {}, child: const Text("See all")),
                ],
              ),
              Container(
                width: 600,
                height: 250,
                child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount : 4,
                itemBuilder: (_, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 180,
                        margin: const EdgeInsets.only(right: 15, top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/futsal.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text("ABC Futsal" ,style: _stackText().merge(
                        const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal
                        )
                      ),),
                      Text("Nadipur pokhara"),
                    ],
                  );
                }),
              )
            ],
          ),
        ),
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
