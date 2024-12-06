import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/challenge_controller.dart';

Future<void> showBaseDialog({
  required String title,
  required String ymd,
  required DateTime startDate,
  required DateTime endDate,
}) async =>
    await Get.dialog(
      BaseDialog(
        title: title,
        ymd: ymd,
        startDate: startDate,
        endDate: endDate,
      ),
    );

class BaseDialog extends GetView<ChallengeController> {
  const BaseDialog({
    super.key,
    required this.title,
    required this.ymd,
    required this.startDate,
    required this.endDate,
  });

  final String title;
  final String ymd;
  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: 290,
        height: 396,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Container(
          height: 396,
          padding: const EdgeInsets.only(bottom: 20),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 290,
                height: 60,
                decoration: const ShapeDecoration(
                  color: Color(0xFF008955),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'CHALLENGE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
              ),
              const Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF1D1B20),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                  ),
                ),
              ),
              const Gap(6),
              Text(
                ymd,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF49454F),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                ),
              ),
              const Gap(40),
              const Text(
                'Members : 1/8\nCigarette : 1 per day\nAbsent : 3 days allowed\nEXP : 2000',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF49454F),
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                  height: 1.4,
                ),
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: InkWell(
                  onTap: () {
                    Get.back();
                    controller.setChallenge(
                      title: title,
                      startDate: startDate,
                      endDate: endDate,
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF008955),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Join',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
