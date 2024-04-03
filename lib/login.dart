import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  login() async{
    final GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;

    final credential=GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (()=>login()),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text('Sign in with Google',style: TextStyle(fontSize: 25),),
          ),
        ),
      ),
    );
  }
}
