import 'package:get/get.dart';

import '../controller/join_controller.dart';
import '../controller/main_controller.dart';

class JoinBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(JoinController());
  }
}
