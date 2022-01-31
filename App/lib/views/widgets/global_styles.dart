import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar _appBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    title: const Text(
      "FUTSA",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}

TextStyle _headerTextStyle() {
  return GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle _subHeaderTextStyle() {
  return GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
  );
}

GestureDetector _getStartedButton(String title){
  return GestureDetector(
    onTap: (){
    },
    child: Container(
      width: 200,
      height: 40,
      alignment: Alignment.center,
      child: Text(title ,style: const TextStyle(
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
