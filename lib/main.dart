import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_37hours/Views/Verify_email.dart';
import 'Views/Register.dart';
import 'Views/login.dart';
import 'dart:developer' as devtools show log;
import 'constants/routes.dart';

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
    routes: {                                                                   // Routes
      loginRoute: (context) => const LoginView(),
      verifyEmail: (context) => const VerifyEmailView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
    },

  ),);
}

enum MenuAction { logout }

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async{
              switch (value){
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);
                  }
                  devtools.log(shouldLogout.toString());
              }
          },
            itemBuilder: (context){
            return const [
              PopupMenuItem<MenuAction>(
              value: MenuAction.logout,
              child: Text("log out"),)];},),
        ],
      ),

      body: const Text("hello world"),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context){
  return showDialog<bool>
    (context: context, builder: (context){
    return  AlertDialog(
      title: const Text("Sign out"),
      content: const Text("are you sure?"),

      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop(false);
        }, child: const Text("Cancel")),

        TextButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, child: const Text("Log out"),
        )

      ],
    );
  }).then((value) => value ?? false);
}



