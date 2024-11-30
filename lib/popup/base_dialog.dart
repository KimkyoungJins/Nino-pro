import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showBaseDialog({
  required String title,
  String confirm = 'calendar_dialog_1',
  String cancel = 'language_dialog_2',
  bool isCancel = false,
  Function(bool)? callback,
}) async =>
    await Get.dialog(
      BaseDialog(
        title: title,
        confirm: confirm.tr,
        cancel: cancel.tr,
        isCancel: isCancel,
        callback: callback,
      ),
    );

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    required this.title,
    required this.confirm,
    required this.cancel,
    required this.isCancel,
    required this.callback,
  });

  final String title;
  final String confirm;
  final String cancel;
  final bool isCancel;
  final Function? callback;

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
        child: Stack(
          children: [
            Container(
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                  const SizedBox(height: 276),
                  InkWell(
                    onTap: Get.back,
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
                ],
              ),
            ),
            const Positioned(
              left: 27,
              top: 18,
              child: SizedBox(
                width: 237,
                child: Text(
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
            ),
            const Positioned(
              left: 54,
              top: 95,
              child: SizedBox(
                width: 183,
                child: Text(
                  '1 Year Challenge',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1D1B20),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.50,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 45,
              top: 124,
              child: SizedBox(
                width: 200,
                child: Text(
                  '2024/01/01 ~ 2024/12/31',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF49454F),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 46,
              top: 183,
              child: SizedBox(
                width: 200,
                child: Text(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
