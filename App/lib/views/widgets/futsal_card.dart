import 'dart:math';

import 'package:flutter/material.dart';
import 'package:futsa/views/pages/futsal_description_page.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FutsalCard extends StatelessWidget {
  String? id;
  String? futsalName;
  String? address;
  String? imageLink;
  int? pricePerHour;
  FutsalCard({
    Key? key,
    required this.id,
    required this.futsalName,
    required this.address,
    required this.imageLink,
    required this.pricePerHour,
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
              imageLink!,
              scale: 3.5,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                futsalName!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 2,
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
              Text(
                "Rs: ${pricePerHour.toString()} /hrs",
                style: const TextStyle(
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
