import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/login_controller.dart';
import 'package:no_smoking/route/routers.dart';

import 'join_page.dart';

void toLoginPage() => Get.toNamed(Routers.login);

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(73),
                const Text(
                  'Nico-Pro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF409462),
                    fontSize: 48,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(73),
                const Text(
                  'Login to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF474747),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(29),
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
                        child: TextField(
                          controller: controller.idController,
                          decoration: const InputDecoration(
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
                const Gap(21),
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
                const Gap(4),
                const Text(
                  'Forgot password?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Color(0xFF008955),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap(24),
                InkWell(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.focusedChild?.unfocus();
                    }

                    controller.onLogin();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF008955),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19006EE9),
                          blurRadius: 6,
                          offset: Offset(1, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF14A3B6),
                          ),
                        ),
                      ),
                    ),
                    const Gap(13),
                    const Text(
                      'Or Login with',
                      style: TextStyle(
                        color: Color(0xFF474747),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Gap(13),
                    Container(
                      width: 10,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF14A3B6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => controller.onGoogleLogin(),
                      child: Container(
                        width: 70,
                        height: 71,
                        padding: const EdgeInsets.all(20),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: Color(0x19006EE9)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            const BoxShadow(
                              color: Color(0x19006EE9),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Image.asset(
                          'assets/ic_google.png',
                        ),
                      ),
                    ),
                    const Gap(40),
                    Container(
                      width: 70,
                      height: 71,
                      padding: const EdgeInsets.all(20),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Color(0x19006EE9)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          const BoxShadow(
                            color: Color(0x19006EE9),
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Image.asset(
                        'assets/ic_facebook.png',
                      ),
                    ),
                    const Gap(40),
                    Container(
                      width: 70,
                      height: 71,
                      padding: const EdgeInsets.all(20),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Color(0x19006EE9)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          const BoxShadow(
                            color: Color(0x19006EE9),
                            blurRadius: 2,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Image.asset(
                        'assets/ic_x.png',
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                InkWell(
                  onTap: () => toJoinPage(),
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account?',
                          style: TextStyle(
                            color: Color(0xFF474747),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Color(0xFF9A9A9A),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF008955),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Color(0xFF9A9A9A),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
