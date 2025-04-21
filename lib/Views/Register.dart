import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_37hours/Views/login.dart';
import 'package:flutter_37hours/constants/routes.dart';
import 'package:flutter_37hours/firebase_options.dart';
// import "dart:developer" as devtools show log;

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
      appBar: AppBar(title: const Text("Register"),),
      body: FutureBuilder(
        future: Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.done:
              return Column(
                children: [

                  // Email TextField
                  TextField(controller: _email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(hintText: "Email"),),

                  // Password TextField
                  TextField(controller: _password,obscureText: true,decoration: const InputDecoration(hintText: "Password"), autocorrect: false,), // Password

                  // Register button
                  TextButton(onPressed: () async
                  {
                    Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform);
                    final email = _email.text;
                    final password = _password.text;
                    try{
                      final userCredential = FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).toString();
                      final user = FirebaseAuth.instance.currentUser;
                      await user?.sendEmailVerification();
                      await showErrorDialog(context, userCredential);
                      Navigator.of(context).pushNamed(verifyEmail);
                    }

                    // Exception
                    on FirebaseException catch(e){
                      if (e.code == 'weak-password'){await showErrorDialog(context, "Weak password $e");}
                      else { await showErrorDialog(context, "Error${e.code}"); }
                      await showErrorDialog(context, "bad ${e.code}");
                    } catch(e){ await showErrorDialog(context, e.toString()); }

                  },
                    child: const Text("Register"),),

                  // Have an account button
                  TextButton(onPressed: (){
                    Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (route) => false,);
                  }, child: const Text("Have an account?"))

                ],
              );
              default: return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}







