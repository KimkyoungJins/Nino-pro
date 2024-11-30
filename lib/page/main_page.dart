import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/binding/challenge_binding.dart';
import 'package:no_smoking/binding/home_binding.dart';
import 'package:no_smoking/binding/progress_binding.dart';
import 'package:no_smoking/binding/result_binding.dart';
import 'package:no_smoking/page/challenge_page.dart';
import 'package:no_smoking/page/home_page.dart';
import 'package:no_smoking/page/progress_page.dart';
import 'package:no_smoking/page/result_page.dart';
import 'package:no_smoking/route/routers.dart';

import '../controller/main_controller.dart';

void toMainPage() => Get.offAllNamed(Routers.main);

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Navigator(
          key: Get.nestedKey(1), // id 설정.
          initialRoute: Routers.home,
          onGenerateRoute: (settings) {
            if (settings.name == Routers.home) {
              return GetPageRoute(
                page: () => const HomePage(),
                binding: HomeBinding(),
                transition: Transition.noTransition,
              );
            } else if (settings.name == Routers.challenge) {
              return GetPageRoute(
                page: () => const ChallengePage(),
                binding: ChallengeBinding(),
                transition: Transition.noTransition,
              );
            } else if (settings.name == Routers.progress) {
              return GetPageRoute(
                page: () => const ProgressPage(),
                binding: ProgressBinding(),
                transition: Transition.noTransition,
              );
            } else if (settings.name == Routers.result) {
              return GetPageRoute(
                page: () => const ResultPage(),
                binding: ResultBinding(),
                transition: Transition.noTransition,
              );
            }

            return null;
          }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
        child: Container(
          width: 393,
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 1, color: Color(0xFF008955)),
            ),
          ),
          child: Row(
            children: MainMenuType.values
                .map(
                  (e) => Expanded(
                    child: InkWell(
                      onTap: () => controller.navigationSelectIndex(e.index),
                      child: Obx(() {
                        Color color = const Color(0xFFAFAFAF);

                        if (controller.type.value == e) {
                          color = const Color(0xFF008955);
                        }

                        return Container(
                          height: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                e.imgUrl,
                                width: 24,
                                height: 24,
                                color: color,
                              ),
                              const Gap(6),
                              Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: color,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
