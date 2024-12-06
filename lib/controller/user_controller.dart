import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  var userid = ''.obs;

  var user = {}.obs;

  @override
  void onInit() {
    super.onInit();
  }
}