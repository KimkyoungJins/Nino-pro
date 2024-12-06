import 'package:get/get.dart';
import 'package:no_smoking/controller/firebase_controller.dart';

import '../main.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var challenge = {}.obs;

  @override
  void onInit() {
    getChallenge();
    super.onInit();
  }

  void getChallenge() async {
    challenge.value = await FirebaseController.to.getChallenge();
    logger.wtf(challenge);
  }
}