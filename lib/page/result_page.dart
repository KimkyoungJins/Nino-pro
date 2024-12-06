import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/home_controller.dart';
import 'package:no_smoking/controller/result_controller.dart';
import 'package:no_smoking/route/routers.dart';

import '../controller/user_controller.dart';

void toResultPage() => Get.toNamed(Routers.result, id: 1);

class ResultPage extends GetView<ResultController> {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            Container(
              color: const Color(0xFF5DB074),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(96),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Gap(38),
                          const Text(
                            'Congratulations!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(18),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Obx(() {
                              return Text(
                                '${HomeController.to.challenge['title']}\nhas been success!!',
                                style: const TextStyle(
                                  color: Color(0xFF353535),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            }),
                          ),
                          const Gap(14),
                          Image.asset(
                            'assets/img_angelic_lung.png',
                            width: 200,
                            height: 182,
                          ),
                          const Gap(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: InkWell(
                              onTap: () => controller.pageController.jumpToPage(1),
                              child: Container(
                                height: 56,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF5DB074),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                child: const Text(
                                  'Check the detail',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(28),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(36),
                const Text(
                  'Challenge result',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      String imgUrl = '';

                      switch (UserController.to.user['smoking_age']) {
                        case 1:
                          imgUrl = 'assets/img_red_lung.png';
                          break;
                        case 2:
                          imgUrl = 'assets/img_sore_lung.png';
                          break;
                        case 3:
                          imgUrl = 'assets/img_little_red_lung.png';
                          break;
                        case 4:
                          imgUrl = 'assets/img_black_lung.png';
                          break;
                        case 5:
                          imgUrl = 'assets/img_deep_dark_lung.png';
                          break;
                      }

                      return Image.asset(
                        imgUrl,
                        width: 127,
                        height: 125,
                      );
                    }),
                    Image.asset(
                      'assets/ic_play.png',
                      width: 48,
                      height: 40,
                    ),
                    Image.asset(
                      'assets/img_angelic_lung.png',
                      width: 127,
                      height: 125,
                    ),
                  ],
                ),
                const Gap(80),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9),
                  child: Text(
                    'The total result',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/ic_money2.png',
                        width: 16,
                        height: 16,
                      ),
                      const Gap(16),
                      const Expanded(
                        child: Text(
                          'Total saved money ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Gap(40),
                      Obx(() {
                        if (HomeController.to.challenge.isEmpty) {
                          return const SizedBox();
                        }

                        DateTime currentDate = DateTime.now();
                        DateTime startDate = DateTime.parse(HomeController.to.challenge['startDate']);

                        int elapsedDuration = currentDate
                            .difference(startDate)
                            .inMinutes;

                        return Text(
                          '${(elapsedDuration * 0.05).ceil()} Dollars',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    height: 0,
                    color: Color(0xFFE8E8E8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/ic_like2.png',
                        width: 16,
                        height: 16,
                      ),
                      const Gap(16),
                      const Expanded(
                        child: Text(
                          'Expanded life span',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Gap(40),
                      Obx(() {
                        if (HomeController.to.challenge.isEmpty) {
                          return const SizedBox();
                        }

                        DateTime currentDate = DateTime.now();
                        DateTime startDate = DateTime.parse(HomeController.to.challenge['startDate']);

                        int elapsedDuration = currentDate
                            .difference(startDate)
                            .inMinutes;

                        return Text(
                          '${(elapsedDuration * 0.05).ceil() / 100} years',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    height: 0,
                    color: Color(0xFFE8E8E8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/ic_progress.png',
                        width: 16,
                        height: 16,
                      ),
                      const Gap(16),
                      const Expanded(
                        child: Text(
                          'Cancer probability',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Gap(40),
                      Obx(() {
                        if (HomeController.to.challenge.isEmpty) {
                          return const SizedBox();
                        }

                        DateTime currentDate = DateTime.now();
                        DateTime startDate = DateTime.parse(HomeController.to.challenge['startDate']);

                        int elapsedDuration = currentDate
                            .difference(startDate)
                            .inMinutes;

                        return Text(
                          '${(elapsedDuration * 0.04).ceil() / 100}% down',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    height: 0,
                    color: Color(0xFFE8E8E8),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: InkWell(
                    onTap: () => controller.onShare(),
                    child: Container(
                      height: 47,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF5DB074),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Share the results',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(37),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
