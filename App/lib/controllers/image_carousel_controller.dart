import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImageCarouselController extends GetxController {
  var selectedImage = 0.obs;

  final List<String> carouselimages = [
    'assets/images/futsal.jpg',
    'assets/images/futsal.jpg',
    'assets/images/futsal.jpg',
    'assets/images/futsal.jpg'
  ];

  final controller = PageController();
}
