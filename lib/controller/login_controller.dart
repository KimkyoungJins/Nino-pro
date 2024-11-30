import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../page/main_page.dart';

class LoginController extends GetxController {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  void onLogin() {
    toMainPage();
  }

  void onGoogleLogin() {
    toMainPage();
  }
}