import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/home_controller.dart';
import 'package:no_smoking/controller/user_controller.dart';
import 'package:no_smoking/main.dart';
import 'package:no_smoking/page/result_page.dart';

import '../route/routers.dart';
import '../util.dart';
import 'progress_page.dart';

void toHomePage() => Get.toNamed(Routers.home, id: 1);

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 92,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              decoration: const BoxDecoration(color: Color(0xFF008955)),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/ic_profile.png',
                      width: 48,
                      height: 48,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(
                      child: Text(
                        'Nico-Pro',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/ic_setting.png',
                      width: 48,
                      height: 48,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 74,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Obx(() {
                    if (controller.challenge.isEmpty) {
                      return const SizedBox();
                    }

                    return InkWell(
                      onTap: () => toProgressPage(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 56,
                              height: 56,
                              child: Obx(
                                () {
                                  if (controller.challenge.isEmpty) {
                                    return const SizedBox();
                                  }

                                  DateTime currentDate = DateTime.now();

                                  DateTime startDate = DateTime.parse(controller.challenge['startDate']);
                                  DateTime endDate = DateTime.parse(controller.challenge['endDate']);

                                  double percentage = calculatePercentage(startDate, endDate, currentDate);
                                  logger.w(percentage);

                                  return CircularProgressIndicator(
                                    value: percentage / 100,
                                    color: const Color(0xFF008955),
                                    backgroundColor: const Color(0xFFE9E9FF),
                                    strokeWidth: 6,
                                    strokeCap: StrokeCap.round,
                                  );
                                },
                              ),
                            ),
                            Obx(() {
                              if (controller.challenge.isEmpty) {
                                return const SizedBox();
                              }

                              DateTime currentDate = DateTime.now();

                              DateTime startDate = DateTime.parse(controller.challenge['startDate']);
                              DateTime endDate = DateTime.parse(controller.challenge['endDate']);

                              double percentage = calculatePercentage(startDate, endDate, currentDate);

                              return Text(
                                '${percentage.ceil()}%',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF409462),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    if (controller.challenge.isEmpty) {
                      return const SizedBox();
                    }

                    DateTime currentDate = DateTime.now();

                    DateTime startDate = DateTime.parse(controller.challenge['startDate']);
                    DateTime endDate = DateTime.parse(controller.challenge['endDate']);

                    double percentage = calculatePercentage(startDate, endDate, currentDate);
                    logger.i(percentage);

                    if ((percentage.ceil()) < 100) {
                      return const SizedBox();
                    }

                    return Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => toResultPage(),
                          child: Image.asset(
                            'assets/ic_result.png',
                            width: 42,
                            height: 42,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
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
                width: 223,
                height: 186,
              );
            }),
            const Gap(32),
            Obx(() {
              String title = '';

              switch (UserController.to.user['smoking_age']) {
                case 1:
                  title = 'red lung';
                  break;
                case 2:
                  title = 'sore lung';
                  break;
                case 3:
                  title = 'little red lung';
                  break;
                case 4:
                  title = 'black lung';
                  break;
                case 5:
                  title = 'deep dark lung';
                  break;
              }

              return Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF008955),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              );
            }),
            const Expanded(child: SizedBox()),
            Obx(() {
              if (controller.challenge.isEmpty) {
                return const SizedBox();
              }

              return Container(
                width: 393,
                height: 154,
                decoration: const BoxDecoration(color: Color(0xFFF0F8F5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Gap(13),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Text(
                        'Challenge',
                        style: TextStyle(
                          color: Color(0xFF008955),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/ic_money.png',
                                width: 36,
                                height: 34,
                              ),
                              const Gap(8),
                              Obx(() {
                                if (controller.challenge.isEmpty) {
                                  return const SizedBox();
                                }

                                DateTime currentDate = DateTime.now();
                                DateTime startDate = DateTime.parse(controller.challenge['startDate']);

                                int elapsedDuration = currentDate.difference(startDate).inMinutes;

                                return Text(
                                  '${(elapsedDuration * 0.05).ceil()} Dollars',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/ic_like.png',
                                width: 36,
                                height: 34,
                              ),
                              const Gap(8),
                              Obx(() {
                                if (controller.challenge.isEmpty) {
                                  return const SizedBox();
                                }

                                DateTime currentDate = DateTime.now();
                                DateTime startDate = DateTime.parse(controller.challenge['startDate']);

                                int elapsedDuration = currentDate.difference(startDate).inMinutes;

                                return Text(
                                  '${(elapsedDuration * 0.05).ceil() / 100} years',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/ic_etc.png',
                                width: 36,
                                height: 34,
                              ),
                              const Gap(8),
                              Obx(() {
                                if (controller.challenge.isEmpty) {
                                  return const SizedBox();
                                }

                                DateTime currentDate = DateTime.now();
                                DateTime startDate = DateTime.parse(controller.challenge['startDate']);

                                int elapsedDuration = currentDate.difference(startDate).inMinutes;

                                return Text(
                                  '-${(elapsedDuration * 0.04).ceil() / 100}%',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
            const Gap(46),
          ],
        ),
      ),
    );
  }
}
