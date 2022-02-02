import "package:flutter/material.dart";
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Create Account,",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Signup to get started!",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.clear)),
                ],
              ),
              const SizedBox(
                height: 25,
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
                        labelText: 'Enter your fullname',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter your email or username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            size: 15,
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _authButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    _authSocialButton(),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I am already a member',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _authButton() {
  return Container(
    alignment: Alignment.center,
    height: 50,
    width: double.infinity,
    child: const Text(
      'Sign up',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ),
    decoration: BoxDecoration(
        color: Colors.teal, borderRadius: BorderRadius.circular(16)),
  );
}

Widget _authSocialButton() {
  return Container(
    alignment: Alignment.center,
    height: 50,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Image.asset(
            'assets/images/googlelogo.png',
          ),
          backgroundColor: Colors.transparent,
          radius: 10,
        ),
        SizedBox(
          width: 10,
        ),
        const Text(
          'Sign in with Google',
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ],
    ),
    decoration: BoxDecoration(
        color: Colors.black12, borderRadius: BorderRadius.circular(16)),
  );
}
