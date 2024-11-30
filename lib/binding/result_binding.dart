import 'package:get/get.dart';
import 'package:no_smoking/controller/result_controller.dart';

import '../controller/join_controller.dart';
import '../controller/main_controller.dart';

class ResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ResultController());
  }
}
