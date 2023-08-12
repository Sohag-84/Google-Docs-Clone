// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/colors.dart';
import 'package:google_docs_clone/models/error_model.dart';
import 'package:google_docs_clone/repository/auth_repository.dart';

import 'home_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void signInWithGoogle(
      {required BuildContext context, required WidgetRef ref}) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    ErrorModel errorModel =
        await ref.watch(authRepositoryProvider).signInWithGoogle();
    if (errorModel.error == null) {
      ref.read(userProvider.notifier).update((state) => errorModel.data);
      navigator.push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      sMessenger.showSnackBar(
        SnackBar(
          content: Text(errorModel.error!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => signInWithGoogle(context: context, ref: ref),
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
