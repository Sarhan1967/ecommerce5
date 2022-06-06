import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import '../constants.dart';
import 'control.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Get.offAll(()=> ControlView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_rounded,
              color: kPrimaryColor,
              size: 80,
            ),
            Text(
              'SHOPEE',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                letterSpacing: 4.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Loading(
                indicator: BallPulseIndicator(),
                size: 60.0,
                color: kPrimaryColor),
          ],
        ),
      ),
    );
  }
}
