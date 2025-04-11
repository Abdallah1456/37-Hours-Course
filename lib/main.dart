import 'package:flutter/material.dart';
import 'Views/Register.dart';
import 'Views/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    // home: const RegisterView(),
    home: const LoginView(),
    routes: {
      "/Login/": (context) => const LoginView(),
      "/Register/": (context) => const RegisterView(),
    },
  ),);
}


