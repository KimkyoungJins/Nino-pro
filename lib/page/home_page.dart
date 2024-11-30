import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/home_controller.dart';
import 'package:no_smoking/page/result_page.dart';

import '../route/routers.dart';
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
                  InkWell(
                    onTap: () => toProgressPage(),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 56,
                            height: 56,
                            child: CircularProgressIndicator(
                              value: 0.6,
                              color: Color(0xFF008955),
                              backgroundColor: Color(0xFFE9E9FF),
                              strokeWidth: 6,
                              strokeCap: StrokeCap.round,
                            ),
                          ),
                          Text(
                            '61%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF409462),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
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
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/img_angelic_lung.png',
              width: 223,
              height: 186,
            ),
            const Gap(32),
            const Text(
              'Angelic Lung',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF008955),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
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
                            const Text(
                              '246 Dollars',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                            const Text(
                              '1.7 years',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                            const Text(
                              '-Risk%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(46),
          ],
        ),
      ),
    );
  }
}
