import 'package:get/get.dart';
import 'package:no_smoking/binding/join_binding.dart';
import 'package:no_smoking/binding/progress_binding.dart';
import 'package:no_smoking/binding/result_binding.dart';
import 'package:no_smoking/page/progress_page.dart';

import '../binding/google_join_binding.dart';
import '../binding/login_binding.dart';
import '../binding/main_binding.dart';
import '../page/google_join_page.dart';
import '../page/join_page.dart';
import '../page/login_page.dart';
import '../page/main_page.dart';
import '../page/result_page.dart';
import '../page/splash_page.dart';
import 'routers.dart';

class Pages {
  static List<GetPage> getPages = [
    GetPage(
      name: Routers.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routers.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routers.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routers.join,
      page: () => const JoinPage(),
      binding: JoinBinding(),
    ),
    GetPage(
      name: Routers.result,
      page: () => const ResultPage(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: Routers.googleJoin,
      page: () => const GoogleJoinPage(),
      binding: GoogleJoinBinding(),
    ),
  ];
}
