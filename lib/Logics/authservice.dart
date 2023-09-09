// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signinwithgoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  registerUser(String email, String Password, BuildContext context) async {
    email = email;
    Password = Password;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: Password);
      AnimatedSnackBar.material(
        'Registration Successful',
        type: AnimatedSnackBarType.success,
      ).show(context);
    

    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        AnimatedSnackBar.material(
          'Invalid EmaIl',
          type: AnimatedSnackBarType.error,
        ).show(context);
      } else if (e.code == 'weak-password') {
        AnimatedSnackBar.material(
          'Weak Password',
          type: AnimatedSnackBarType.error,
        ).show(context);
      } else if (e.code == 'email-already-in-use') {
        AnimatedSnackBar.material(
          'Email Already in use',
          type: AnimatedSnackBarType.warning,
        ).show(context);
      }
    }
  }

  //Login User Start

  loginuser(String email, String password, BuildContext context) async {
    email = email;
    password = password;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      AnimatedSnackBar.material(
        'Login Successful',
        type: AnimatedSnackBarType.success,
      ).show(context);
      Navigator.pushNamed(context, '/homepage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AnimatedSnackBar.material(
          'User Not Find',
          type: AnimatedSnackBarType.error,
        ).show(context);
      } else if (e.code == 'wrong-password') {
        AnimatedSnackBar.material(
          'Wrong Password',
          type: AnimatedSnackBarType.error,
        ).show(context);
      } else if (e.code == "invalid email") {}
    }
  }

  sendresetemail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Password reset email sent successfully.
    } catch (e) {
      // Handle errors, e.g., if the email address is not found.
      print("Error sending password reset email: $e");
    }
  }

  //Login User End
}
