import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_37hours/constants/routes.dart';
import 'package:flutter_37hours/firebase_options.dart';
import 'package:flutter_37hours/main.dart';
import "dart:developer" as devtools show log;

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

                  // Login button
                  TextButton(onPressed: () async
                  {  // Register Button
                    Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform);
                    final email = _email.text;
                    final password = _password.text;

                    try{
                      final userCredential = FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                      final user = FirebaseAuth.instance.currentUser;
                      Navigator.of(context).pushNamedAndRemoveUntil(notesRoute, (route) => false,);
                      devtools.log(userCredential.toString());
                      devtools.log(user.toString());
                      if (user != null){
                        if(user?.emailVerified ?? false){const Text("Done");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotesView(),));}
                        else{
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotesView(),));
                        }}
                      else {
                        // return  const LoginView();
                      }

                      // Error exceptions
                    } on FirebaseAuthException catch(e){
                      if (e.code == 'user-not-found'){ await showErrorDialog(context, "User not found"); }
                      else if (e.code == "Wrong password") {await showErrorDialog(context,"Wrong password\n$e");}
                      else { await showErrorDialog(context,"bad\n$e"); }
                    }
                  },

                    child: const Text("Login"),
                  ),

                    TextButton(onPressed: (){
                      Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false,);
                    }, child: const Text("Not registered yet?")),
                ],
              );
              default: return const Text("loading");
          }

        },
      ),
    );
  }
}

Future<void> showErrorDialog(BuildContext context, String text,)async {
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text("An error has occurred"),
      content: Text(text),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: const Text("OK"))
      ],
    );

  });
}
