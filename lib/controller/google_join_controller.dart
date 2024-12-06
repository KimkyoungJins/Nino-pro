import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/firebase_controller.dart';
import 'package:toastification/toastification.dart';

class GoogleJoinController extends GetxController {
  Map<dynamic, dynamic> age = {
    0: 'Select your smoking history',
    1: 'Less than a year',
    2: '1year ~ 5years',
    3: '6years ~ 10years',
    4: '10years~20years',
    5: 'Etc',
  };

  Map<dynamic, dynamic> count = {
    0: '1~10',
    1: '10~20',
    2: '1~2packs',
    3: '2~3packs',
    4: 'Etc',
  };

  var selectedAge = 0.obs;
  var selectedCount = 0.obs;

  Map<String, dynamic> data = Get.arguments['data'];

  @override
  void onInit() {
    super.onInit();
  }

  void onJoin() async {
    if (selectedAge.value == 0) {
      toast('Please select a smoking record.');
      return;
    }
    // if (selectedCount.value == -1) {
    //   toast('Please select the number of times you smoke.');
    //   return;
    // }

    data..['smoking_age'] = selectedAge.value..['smoking_count'] = selectedCount.value;

    final res = await FirebaseController.to.onJoin(data);

    if (res) {
      Get.back();
    }
  }

  void toast(String title) {
    toastification.show(
      context: Get.context,
      title: Text(title),
      autoCloseDuration: const Duration(seconds: 2),
      showProgressBar: false,
    );
  }
}
