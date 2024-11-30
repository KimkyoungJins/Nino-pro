import 'package:get/get.dart';
import 'package:no_smoking/controller/progress_controller.dart';

class ProgressBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProgressController());
  }
}
