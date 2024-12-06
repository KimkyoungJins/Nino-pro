import 'package:get/get.dart';
import 'package:no_smoking/controller/google_join_controller.dart';

import '../controller/join_controller.dart';
import '../controller/main_controller.dart';

class GoogleJoinBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GoogleJoinController());
  }
}
