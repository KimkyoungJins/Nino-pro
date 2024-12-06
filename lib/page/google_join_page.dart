import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/google_join_controller.dart';
import 'package:no_smoking/route/routers.dart';

import '../controller/join_controller.dart';

void toGoogleJoinPage(Map<String, dynamic> data) => Get.toNamed(Routers.googleJoin, arguments: {'data': data});

class GoogleJoinPage extends GetView<GoogleJoinController> {
  const GoogleJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
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
                        child: Obx(() {
                          return DropdownButton<dynamic>(
                            value: controller.selectedAge.value,
                            isExpanded: true,
                            hint: Text(
                              'Select an Option',
                              style: TextStyle(
                                color: Color(0xFF9A9A9A),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            style: TextStyle(
                              color: Color(0xFF9A9A9A),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            dropdownColor: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            icon: Image.asset(
                              'assets/ic_arrow_down.png',
                              width: 24,
                              height: 24,
                            ),
                            underline: Container(
                              height: 0,
                              color: Colors.blue,
                            ),
                            onChanged: (dynamic newKey) {
                              controller.selectedAge.value = newKey;
                            },
                            items: controller.age.entries.map((entry) {
                              return DropdownMenuItem<dynamic>(
                                value: entry.key, // Use unique key from the Map
                                child: Text(entry.value),
                              );
                            }).toList(),
                          );
                        }),
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
                        child: Obx(() {
                          return DropdownButton<dynamic>(
                            value: controller.selectedCount.value,
                            isExpanded: true,
                            hint: Text(
                              'Select the amount of smoking per day',
                              style: TextStyle(
                                color: Color(0xFF9A9A9A),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            style: TextStyle(
                              color: Color(0xFF9A9A9A),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            dropdownColor: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            icon: Image.asset(
                              'assets/ic_arrow_down.png',
                              width: 24,
                              height: 24,
                            ),
                            underline: Container(
                              height: 0,
                              color: Colors.blue,
                            ),
                            onChanged: (dynamic newKey) {
                              controller.selectedCount.value = newKey;
                            },
                            items: controller.count.entries.map((entry) {
                              return DropdownMenuItem<dynamic>(
                                value: entry.key, // Use unique key from the Map
                                child: Text(entry.value),
                              );
                            }).toList(),
                          );
                        }),
                      ),
                      Gap(100),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: InkWell(
            onTap: () => controller.onJoin(),
            child: Container(
              width: double.infinity,
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
      ),
    );
  }
}
