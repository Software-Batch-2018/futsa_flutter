import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalStyles {
  AppBar appBar(String titleText) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        titleText,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  TextStyle headerTextStyle() {
    return GoogleFonts.openSans(
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  TextStyle subHeaderTextStyle() {
    return GoogleFonts.openSans(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
    );
  }

  GestureDetector getStartedButton(String title, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 200,
        height: 40,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.teal)),
      ),
    );
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
