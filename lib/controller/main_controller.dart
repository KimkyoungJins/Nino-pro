import 'package:get/get.dart';
import 'package:no_smoking/page/challenge_page.dart';
import 'package:no_smoking/page/home_page.dart';

enum MainMenuType {
  home(
    0,
    'Home',
    'assets/ic_home.png',
  ),
  community(
    1,
    'Challenge',
    'assets/ic_challenge.png',
  );

  const MainMenuType(
    this.menuIndex,
    this.title,
    this.imgUrl,
  );

  final int menuIndex;
  final String title;
  final String imgUrl;

  factory MainMenuType.getByCode(int menuIndex) {
    return MainMenuType.values.firstWhere((value) => value.menuIndex == menuIndex, orElse: () => MainMenuType.home);
  }
}

class MainController extends GetxController {
  var type = MainMenuType.home.obs;

  void navigationSelectIndex(int index) async {
    switch (index) {
      case 0:
        if (type.value == MainMenuType.home) return;
        toHomePage();
        type.value = MainMenuType.home;
        return;
      case 1:
        if (type.value == MainMenuType.community) return;
        toChallengePage();
        type.value = MainMenuType.community;
        return;
    }
  }
}
