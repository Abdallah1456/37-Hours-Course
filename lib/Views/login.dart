import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_37hours/firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState(){
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),),
      body: FutureBuilder(
        future: Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.done:
              return Column(
                children: [

                  TextField(controller: _email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(hintText: "Email"),),

                  TextField(controller: _password,obscureText: true,decoration: const InputDecoration(hintText: "Password"), autocorrect: false,), // Password

                  TextButton(onPressed: () async
                  {  // Register Button
                    Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform);
                    final email = _email.text;
                    final password = _password.text;

                    try{
                      final userCredential = FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                      final user = FirebaseAuth.instance.currentUser?.emailVerified;
                      print("${FirebaseAuth.instance.currentUser} Signed in");
                    } on FirebaseException catch(e){
                      if (e.code == 'user-not-found'){print("User not found");}
                      print("bad\n$e");
                    }

                    },
                    child: const Text("Login"),),
                ],
              ); default: return const Text("loading");
          }

        },
      ),
    );
  }
}
