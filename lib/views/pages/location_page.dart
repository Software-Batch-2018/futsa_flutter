import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_location , color: Colors.teal,),
                  Text('Location Setup', style: _headerTextStyle()),
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
            const SizedBox(height: 50,),
            Image.asset("assets/images/location.png" , fit: BoxFit.contain,), const SizedBox(height: 50,),
            Container(
              child: _getStartedButton(),
            )
            ],
          ),
        ),
      ),
    );
  }
}

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

GestureDetector _getStartedButton(){
  return GestureDetector(
    onTap: (){
    },
    child: Container(
      width: 200,
      height: 40,
      alignment: Alignment.center,
      child: const Text("Next" ,style: TextStyle(
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