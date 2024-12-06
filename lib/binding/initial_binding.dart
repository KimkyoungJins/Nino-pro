import 'package:get/get.dart';
import 'package:no_smoking/controller/firebase_controller.dart';
import 'package:no_smoking/controller/result_controller.dart';
import 'package:no_smoking/controller/user_controller.dart';

import '../controller/join_controller.dart';
import '../controller/main_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseController(), permanent: true);
    Get.put(UserController(), permanent: true);
  }
}
