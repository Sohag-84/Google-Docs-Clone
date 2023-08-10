// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/colors.dart';
import 'package:google_docs_clone/repository/auth_repository.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void signInWithGoogle({required WidgetRef ref}) {
    ref.watch(authRepositoryProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () =>signInWithGoogle(ref: ref),
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
