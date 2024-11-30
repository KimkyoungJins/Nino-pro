import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ResultController extends GetxController {
  final pageController = PageController();

  void onShare() async {
    final result = await Share.share('test');
  }
}