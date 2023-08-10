// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_docs_clone/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Image.asset("assets/g-logo.png", height: 20),
          label: Text(
            "Sign in with Google",
            style: TextStyle(
              color: kBlackColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: kWhiteColor,
            minimumSize: Size(150, 50),
          ),
        ),
      ),
    );
  }
}
