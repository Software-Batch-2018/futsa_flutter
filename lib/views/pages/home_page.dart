
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futsa/controllers/outbound_page_controller.dart';
import 'package:futsa/views/pages/location_page.dart';
import 'package:futsa/views/widgets/outbound_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Auth/signin.dart';

class Homepage extends StatelessWidget {
  final _outboundPageController = OutboundController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
            controller: _outboundPageController.controller,
            onPageChanged: _outboundPageController.selectedPage,
            itemCount: _outboundPageController.outBoundPages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: double.infinity,
                color: Colors.white,
                child: OutboundPage(
                  imageAsset:
                      _outboundPageController.outBoundPages[index].imageAsset,
                  title: _outboundPageController.outBoundPages[index].title,
                  description:
                      _outboundPageController.outBoundPages[index].description,
                ),
              );
            },
          ),
          Positioned(
            left: 50,
            bottom: 100,
            child: Row(
              children: List.generate(
                  _outboundPageController.outBoundPages.length,
                  (index) => Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  _outboundPageController.selectedPage.value ==
                                          index
                                      ? Colors.teal
                                      : Colors.teal[100],
                            ),
                          ),
                        ),
                      )),
            ),
          ),
          Positioned(
            bottom: 35,
            left: 50,
            right: 50,
            child: _getStartedButton(),
            // CircleAvatar(
            //   child: IconButton(
            //     icon: !_outboundPageController.isFinalPage
            //         ? const Icon(
            //             Icons.arrow_forward,
            //             color: Colors.white,
            //           )
            //         : const Icon(
            //             Icons.login,
            //             color: Colors.white,
            //           ),
            //     onPressed: _outboundPageController.nextPage,
            //   ),
            // ),
          ),
        ]),
      ),
    );
  }
}



AppBar _appBar(){
  return AppBar(
    backgroundColor: Colors.white,
    title: const Center(
      child: Text("FUTSA" ,style: TextStyle(
        color: Colors.black,
      ),),
    ),
    elevation: 0,
  );
}



GestureDetector _getStartedButton(){
  return GestureDetector(
    onTap: (){
      Get.toNamed('/location');
    },
    child: Container(
      width: 200,
     height: 40,
     alignment: Alignment.center,
      child: const Text("Get Started" ,style: TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.teal)
      ),
    ),
  );
}