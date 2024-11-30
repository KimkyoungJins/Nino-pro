import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/progress_controller.dart';
import 'package:no_smoking/route/routers.dart';

import '../controller/join_controller.dart';

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
            Gap(20),
            Container(
              height: 35,
              alignment: Alignment.center,
              child: Text(
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
            Gap(60),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: 0.6,
                    color: Color(0xFF008955),
                    backgroundColor: Color(0xFFE9E9FF),
                    strokeWidth: 20,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(
                  '61%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF409462),
                    fontSize: 45,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
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
                      Gap(16),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: ShapeDecoration(
                              color: Color(0xFF5DB074),
                              shape: OvalBorder(),
                            ),
                          ),
                          Gap(16),
                          Expanded(
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
                          Text(
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
                      Gap(16),
                      Divider(
                        height: 0,
                        color: Color(0xFFE8E8E8),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Gap(6),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: ShapeDecoration(
                              color: Color(0xFF5DB074),
                              shape: OvalBorder(),
                            ),
                          ),
                          Gap(16),
                          Expanded(
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
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/ic_round.png'),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '4/4',
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
                      Gap(6),
                      Divider(
                        height: 0,
                        color: Color(0xFFE8E8E8),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Gap(16),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: ShapeDecoration(
                              color: Color(0xFF5DB074),
                              shape: OvalBorder(),
                            ),
                          ),
                          Gap(16),
                          Expanded(
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
                          Text(
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
                      Gap(16),
                      Divider(
                        height: 0,
                        color: Color(0xFFE8E8E8),
                      ),
                    ],
                  ),
                  Gap(67),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
