import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:no_smoking/page/main_page.dart';

class JoinController extends GetxController {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final rePwController = TextEditingController();

  void onJoin() {
    toMainPage();
  }
}