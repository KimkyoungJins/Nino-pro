import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/result_controller.dart';
import 'package:no_smoking/route/routers.dart';

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
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: Text(
                              '1 Year smoke free challenge\nhas been success!!',
                              style: TextStyle(
                                color: Color(0xFF353535),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                    Image.asset(
                      'assets/img_red_lung.png',
                      width: 127,
                      height: 125,
                    ),
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
                      const Text(
                        '5,680,030',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                      const Text(
                        '2 years',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                      const Text(
                        '15% down',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
