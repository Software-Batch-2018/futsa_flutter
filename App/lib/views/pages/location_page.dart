import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/global_styles.dart';
import "package:get/get.dart";

class LocationPage extends StatelessWidget {
  LocationPage({Key? key}) : super(key: key);
  final GlobalStyles _globalStyles = GlobalStyles();

  void nextPage() {
    Get.toNamed('/main');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalStyles.appBar('FUTSA'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_location,
                    color: Colors.teal,
                  ),
                  Text('Location Setup',
                      style: _globalStyles.headerTextStyle()),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter your location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        suffixIcon: Icon(
                          Icons.send,
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/location.png",
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: _globalStyles.getStartedButton('Next', nextPage),
              )
            ],
          ),
        ),
      ),
    );
  }
}
