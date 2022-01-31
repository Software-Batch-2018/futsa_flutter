import 'package:flutter/cupertino.dart';
import 'package:futsa/models/outbound_page_model.dart';
import "package:get/get.dart";

import '../views/pages/location_page.dart';

class OutboundController extends GetxController {
  final List<Outbound> outBoundPages = [
    Outbound(
      imageAsset: "assets/images/firstpage.png",
      title: "Welcome to futsa",
      description: "Trusted by millions, Futsa is a secure futsal booking system making futsal booking digilatized.",
    ),
    Outbound(
      imageAsset: "assets/images/secondpage.png",
      title: "Footballer",
      description: "Sign in and enjoy the best deals.",
    ),
    Outbound(
      imageAsset: "assets/images/thirdpage.png",
      title: "Futsal Owner",
      description: "Sign in and list your futsal and make it easilt assessible to the players around you city.",
    )
  ];

  var selectedPage = 0.obs;
  final controller = PageController();

   nextPage(){
     if(isFinalPage){
        Get.to(const LocationPage());
     }
     else{
       controller.nextPage(duration: 300.milliseconds, curve: Curves.easeInOut);
     }
  }

 bool get isFinalPage => selectedPage.value == outBoundPages.length -1 ;
}

