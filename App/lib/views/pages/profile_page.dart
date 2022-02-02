import 'package:flutter/material.dart';
import 'package:futsa/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final _authController = Get.put(AuthController());

  final scrollController = Get.put(ScrollController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_authController.isAuth.isTrue) {
        return Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Stack(children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.teal,
                ),
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              )),
                          Text(
                            'Profile',
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CircleAvatar(
                        foregroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        radius: 40,
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Saroj Aryal",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      Text(
                        "Pokhara-17",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )),
                      )
                    ],
                  ),
                )
              ]),
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  menuBox(
                    'Bookings',
                    Icons.data_usage,
                  ),
                  menuBox(
                    'History',
                    Icons.history,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _authController.toogleAuthStatus(),
                child: const Text("Sign out"),
              )
            ]),
          ),
        );
      } else {
        return Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/signin');
                },
                child: const Text("Sign in ")));
      }
    });
  }

  Expanded menuBox(String text, IconData iconName) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.all(10),
        color: Colors.grey[200],
        alignment: Alignment.center,
        child: Column(
          children: [
            Icon(
              iconName,
              color: Colors.teal,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black54)),
            )
          ],
        ),
      ),
    );
  }
}
