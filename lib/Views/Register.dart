import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_37hours/firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState(){
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.done:
              return Column(
                children: [

                  TextField(controller: _email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(hintText: "Email"),),

                  TextField(controller: _password,obscureText: true,decoration: const InputDecoration(hintText: "Password"), autocorrect: false,), // Password

                  TextButton(onPressed: () async {  // Register Button
                    Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform);
                    final email = _email.text;
                    final password = _password.text;
                    try{
                      final userCredential = FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                      print(userCredential);
                    } on FirebaseException catch(e){
                      if (e.code == 'weak-password'){print("Weak password $e");}
                      print("bad ${e.code}");
                    }
                  },child: const Text("Register"),),
                ],
              ); default: return const Text("loading");
          }
        },
      ),
    );
  }
}




