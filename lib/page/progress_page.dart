import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:no_smoking/controller/home_controller.dart';
import 'package:no_smoking/controller/progress_controller.dart';
import 'package:no_smoking/route/routers.dart';

import '../controller/join_controller.dart';
import '../main.dart';
import '../util.dart';

void toProgressPage() => Get.toNamed(Routers.progress, id: 1);

class ProgressPage extends GetView<ProgressController> {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(20),
            Container(
              height: 35,
              alignment: Alignment.center,
              child: const Text(
                'Progress',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Gap(60),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Obx(() {
                    if (controller.challenge.isEmpty) {
                      return const SizedBox();
                    }

                    DateTime currentDate = DateTime.now();

                    DateTime startDate = DateTime.parse(controller.challenge['startDate']);
                    DateTime endDate = DateTime.parse(controller.challenge['endDate']);

                    double percentage = calculatePercentage(startDate, endDate, currentDate);
                    logger.w(percentage);

                    return CircularProgressIndicator(
                      value: percentage,
                      color: Color(0xFF008955),
                      backgroundColor: Color(0xFFE9E9FF),
                      strokeWidth: 20,
                      strokeCap: StrokeCap.round,
                    );
                  }),
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
                    style: TextStyle(
                      color: Color(0xFF409462),
                      fontSize: 45,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }),
              ],
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Information',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 20,
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(16),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF5DB074),
                              shape: OvalBorder(),
                            ),
                          ),
                          const Gap(16),
                          const Expanded(
                            child: Text(
                              'Period',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Obx(() {
                            String startFormattedDate = DateFormat('yyyy.MM.dd').format(DateTime.parse(HomeController.to.challenge['startDate']));
                            String endFormattedDate = DateFormat('yyyy.MM.dd').format(DateTime.parse(HomeController.to.challenge['endDate']));

                            String title = '$startFormattedDate ~ $endFormattedDate';

                            return Text(
                              title,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          }),
                        ],
                      ),
                      const Gap(16),
                      const Divider(
                        height: 0,
                        color: Color(0xFFE8E8E8),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Gap(6),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF5DB074),
                              shape: OvalBorder(),
                            ),
                          ),
                          const Gap(16),
                          const Expanded(
                            child: Text(
                              'Member',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            width: 57,
                            height: 37.22,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/ic_round.png'),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              '1/8',
                              style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 17,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(6),
                      const Divider(
                        height: 0,
                        color: Color(0xFFE8E8E8),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap(16),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF5DB074),
                              shape: OvalBorder(),
                            ),
                          ),
                          const Gap(16),
                          const Expanded(
                            child: Text(
                              'calendar',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Text(
                            '2022.12.1~2023.11.1',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                      const Divider(
                        height: 0,
                        color: Color(0xFFE8E8E8),
                      ),
                    ],
                  ),
                  const Gap(67),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
