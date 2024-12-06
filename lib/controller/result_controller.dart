import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/firebase_controller.dart';
import 'package:no_smoking/controller/home_controller.dart';
import 'package:no_smoking/page/home_page.dart';
import 'package:share_plus/share_plus.dart';

class ResultController extends GetxController {
  final pageController = PageController();

  void onShare() async {
    final result = await Share.share('result');

    await FirebaseController.to.deleteChallenge();

    HomeController.to.getChallenge();
    toHomePage();
  }
}