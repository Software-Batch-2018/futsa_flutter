import 'dart:math';
import 'package:flutter/material.dart';
import 'package:futsa/views/pages/futsal_description_page.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FutsalBoxCard extends StatelessWidget {
  String? id;
  String? futsalName;
  String? address;
  String? imageLink;
  int? pricePerHour;
  FutsalBoxCard({
    Key? key,
    required this.id,
    required this.futsalName,
    required this.address,
    required this.imageLink,
    required this.pricePerHour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(FutsalDescription());
      },
      child: SizedBox(
        height: 175,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    imageLink!,
                    scale: 3,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Column(
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
                        futsalName!,
                        style: _stackText().merge(const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 15,
                            color: Colors.black45,
                          ),
                          Text(
                            address!,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Rs: ${pricePerHour.toString()} /hrs",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
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
