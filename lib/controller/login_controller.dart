import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/firebase_controller.dart';
import 'package:no_smoking/main.dart';
import 'package:no_smoking/page/google_join_page.dart';

import '../page/main_page.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginController extends GetxController {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  void onLogin() async {
    if(idController.text.trim().isEmpty) return;
    if(pwController.text.trim().isEmpty) return;

    final res = await FirebaseController.to.onLogin(idController.text, pwController.text);

    if(res) {
      toMainPage();
    } else {
    }
  }

  void onGoogleLogin() async {
    final user = await signInWithGoogle();

    if(user.user != null) {
      logger.w(user.user?.uid);

      final data = {
        'name': user.user?.displayName ?? 'user',
        'id': 'GOOGLE_${user.user?.uid}',
        'pw': user.user?.uid,
        'smoking_age': 0,
        'smoking_count': 0,
      };

      var res = await FirebaseController.to.onLogin(data['id'].toString(), data['pw'].toString());

      if(res) {
        toMainPage();
      } else {
        toGoogleJoinPage(data);
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}