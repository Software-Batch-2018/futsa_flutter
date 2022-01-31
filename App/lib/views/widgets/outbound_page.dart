import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "./global_styles.dart";

class OutboundPage extends StatelessWidget {
  String imageAsset;
  String title;
  String description;

  final GlobalStyles _globalStyles = GlobalStyles();

  OutboundPage(
      {Key? key,
      required this.imageAsset,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: _globalStyles.headerTextStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                style: _globalStyles.subHeaderTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
                height: 300,
                width: 500,
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.contain,
                )),
          ],
        ),
        SizedBox(
          height: 70,
        )
      ],
    );
  }
}

