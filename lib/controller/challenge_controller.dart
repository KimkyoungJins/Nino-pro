import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/firebase_controller.dart';
import 'package:no_smoking/controller/home_controller.dart';
import 'package:no_smoking/page/home_page.dart';
import 'package:toastification/toastification.dart';

class ChallengeController extends GetxController {

  void setChallenge({
    required String title,
    required DateTime startDate,
    required DateTime endDate,
}) async {
    final data = {
      'title': title,
      'startDate': startDate.toString(),
      'endDate': endDate.toString(),
    };

    if(title == '1-Day No Smoking Challenge') {
      data['endDate'] = startDate.toString();
    }

    final res = await FirebaseController.to.setChallenge(data);

    if(res) {
      toastification.show(
        context: Get.context,
        type: ToastificationType.success,
        title: const Text("Start the cell."),
        autoCloseDuration: const Duration(seconds: 2),
        showProgressBar: false,
      );
      HomeController.to.getChallenge();
      toHomePage();
    } else {
      toastification.show(
        context: Get.context,
        title: const Text("I'm already in the process of celling."),
        autoCloseDuration: const Duration(seconds: 2),
        showProgressBar: false,
      );
    }
  }
}