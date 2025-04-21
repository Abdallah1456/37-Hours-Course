import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_37hours/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Column
      (children: [
      const Text("An email verification has been sent\n"),
      const Text("Haven't received a verification?\n"),
      TextButton(onPressed: () async{
        final user = FirebaseAuth.instance.currentUser;
        user?.sendEmailVerification();
      }, child: const Text("Send email")),

      // Restart button
      TextButton(onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);
      }, child: const Text("Restart"))

    ],);
  }
}