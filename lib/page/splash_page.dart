import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../route/routers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isPage = false;

  @override
  Widget build(BuildContext context) {
    if(!isPage) {
      Timer(const Duration(seconds: 1), () {
        Get.offAllNamed(Routers.login);
      });
      isPage = true;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF409562),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Gap(165),
          Text(
            'Nico-Pro',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 70,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
