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
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Stack(children: [
                Container(
                  height: 300,
                  width: double.infinity,
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
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ]),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3,
              child: Container(
                height: 450,
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
                        // Row(
                        //   children: List.generate(
                        //       _carouselController.carouselimages.length,
                        //       (index) => Obx(
                        //             () => Padding(
                        //               padding: const EdgeInsets.symmetric(
                        //                   horizontal: 6),
                        //               child: Container(
                        //                 height: 8,
                        //                 width: 8,
                        //                 decoration: BoxDecoration(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   color: _carouselController
                        //                               .selectedImage.value ==
                        //                           index
                        //                       ? Colors.black54
                        //                       : Colors.black26,
                        //                 ),
                        //               ),
                        //             ),
                        //           )),
                        // ),
                        const Text(
                          'ABC futsal pvt. Ltd',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
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
                        Flex(
                          direction: Axis.horizontal,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _globalStyles.menuBox(
                              'Bookings',
                              Icons.data_usage,
                            ),
                            _globalStyles.menuBox(
                              'History',
                              Icons.history,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
