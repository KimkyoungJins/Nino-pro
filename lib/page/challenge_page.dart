import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:no_smoking/controller/challenge_controller.dart';
import 'package:no_smoking/controller/result_controller.dart';
import 'package:no_smoking/popup/base_dialog.dart';
import 'package:no_smoking/route/routers.dart';

void toChallengePage() => Get.toNamed(Routers.challenge, id: 1);

class ChallengePage extends GetView<ChallengeController> {
  const ChallengePage({super.key});


  Widget _item(String title, DateTime startDate, DateTime endDate) {
    return InkWell(
      onTap: () {
        String startFormattedDate = DateFormat('yyyy/MM/dd').format(startDate);
        String endFormattedDate = DateFormat('yyyy/MM/dd').format(endDate);

        showBaseDialog(
          title: title,
          ymd: '$startFormattedDate ~ $endFormattedDate',
          startDate: startDate,
          endDate: endDate,
        );
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF008955)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF1D1B20),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
        ),
      ),
    );
  }

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
              alignment: Alignment.center,
              child: const Text(
                'Challenge',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Gap(13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'All',
                            style: TextStyle(
                              color: Color(0xFF008955),
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.13,
                            ),
                          ),
                          const Gap(8),
                          Container(
                            width: 20,
                            height: 16,
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF008955),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '31',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(8),
                      Container(
                        width: 2,
                        height: 16,
                        color: const Color(0xFFBDBDBD),
                      ),
                      const Gap(8),
                      Row(
                        children: [
                          const Text(
                            'Time',
                            style: TextStyle(
                              color: Color(0xFF828282),
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.13,
                            ),
                          ),
                          const Gap(8),
                          Container(
                            width: 14,
                            height: 16,
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              '0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: -0.10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(8),
                      Row(
                        children: [
                          const Text(
                            'Cigar amount',
                            style: TextStyle(
                              color: Color(0xFF828282),
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.13,
                            ),
                          ),
                          const Gap(8),
                          Container(
                            width: 14,
                            height: 16,
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              '0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: -0.10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        width: 72,
                        height: 25.74,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF008955),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Filter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: -0.13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(8),
                  _item(
                    '1-Day No Smoking Challenge',
                    DateTime.now(),
                    DateTime.now().add(const Duration(days: 1)),
                  ),
                  Gap(11),
                  _item(
                    '1-Week No Smoking Challenge',
                    DateTime.now(),
                    DateTime.now().add(const Duration(days: 7)),
                  ),
                  Gap(11),
                  _item(
                    '2-Week No Smoking Challenge',
                    DateTime.now(),
                    DateTime.now().add(const Duration(days: 14)),
                  ),
                  Gap(11),
                  _item(
                    '1-Month No Smoking Challenge',
                    DateTime.now(),
                    DateTime(
                      DateTime.now().year,
                      DateTime.now().month + 1,
                      DateTime.now().day,
                    ),
                  ),
                  Gap(11),
                  _item(
                    '6-Month No Smoking Challenge',
                    DateTime.now(),
                    DateTime(
                      DateTime.now().year,
                      DateTime.now().month + 6,
                      DateTime.now().day,
                    ),
                  ),
                  Gap(11),
                  _item(
                    '1-Year No Smoking Challenge',
                    DateTime.now(),
                    DateTime(
                      DateTime.now().year + 1,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
                  ),
                  Gap(11),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
