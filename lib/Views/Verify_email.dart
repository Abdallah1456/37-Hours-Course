import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      const Text("Please Verify email adress"),
      TextButton(onPressed: () async{
        final user = FirebaseAuth.instance.currentUser;
        user?.sendEmailVerification();
      }, child: const Text("Sednd email"))
    ],);
  }
}