import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/route/routers.dart';

import '../controller/join_controller.dart';

void toJoinPage() => Get.toNamed(Routers.join);

class JoinPage extends GetView<JoinController> {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: InkWell(
                onTap: Get.back,
                child: Image.asset(
                  'assets/ic_back.png',
                  alignment: AlignmentDirectional.centerStart,
                  width: 22,
                  height: 22,
                ),
              ),
            ),
            const Gap(7),
            const Text(
              'Nico-Pro',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF008955),
                fontSize: 48,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/ic_username.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fitHeight,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                              right: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: TextField(
                            controller: controller.nameController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 18.5),
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Image.asset(
                        'assets/ic_id.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fitHeight,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                              right: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 18.5),
                              hintText: 'ID',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Image.asset(
                        'assets/ic_pw.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fitHeight,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                              right: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: TextField(
                            controller: controller.pwController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 18.5),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    children: [
                      Image.asset(
                        'assets/ic_pw.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fitHeight,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                              right: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                              bottom: BorderSide(
                                width: 1,
                                color: Color(0x19004646),
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: TextField(
                            controller: controller.rePwController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 18.5),
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 11,
                      left: 16.50,
                      right: 10,
                      bottom: 10,
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0x19004646)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Select your smoking history',
                            style: TextStyle(
                              color: Color(0xFF9A9A9A),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        const Gap(75),
                        Image.asset(
                          'assets/ic_arrow_down.png',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                  const Gap(30),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 11,
                      left: 16.50,
                      right: 10,
                      bottom: 10,
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0x19004646)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Select the amount of smoking per day',
                            style: TextStyle(
                              color: Color(0xFF9A9A9A),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 75.50),
                        Container(
                          height: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/ic_arrow_down.png',
                                width: 24,
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          onTap: () => controller.onJoin(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            decoration: ShapeDecoration(
              color: Color(0xFF008955),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x19006EE9),
                  blurRadius: 6,
                  offset: Offset(1, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Text(
              'Register',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
