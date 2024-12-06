import 'package:get/get.dart';

import '../main.dart';
import 'firebase_controller.dart';

class ProgressController extends GetxController {

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