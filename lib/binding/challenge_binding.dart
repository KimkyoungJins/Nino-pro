import 'package:get/get.dart';
import 'package:no_smoking/controller/challenge_controller.dart';

class ChallengeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChallengeController());
  }
}
