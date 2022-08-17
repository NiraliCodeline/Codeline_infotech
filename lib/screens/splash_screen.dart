import 'dart:async';

import 'package:codeline_infotech/constant/colors.dart';
import 'package:codeline_infotech/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  String? userEmail;

  AnimationController? animationController;
  Animation<double>? animation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController!);
    animationController?.forward();

    Future<dynamic>.delayed(Duration(seconds: 3), () {
      setState(() {
        var token = GetStorage().read('token');

        print("TOKEN--------------${token}");
        token == null ? Get.offAll(LogInScreen()) : Get.offAll(HomeScreen());
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.27.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06.sp),
            child: FadeTransition(
              opacity: animation!,
              child: Container(
                height: Get.height / 2.8.sp,
                width: Get.width.sp,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/CodelineSpalsh.png"),
                        fit: BoxFit.fill)),
                /*child: SvgPicture.asset(
                  "assets/images/SplashScreen_Icon.svg",
                  fit: BoxFit.fill,
                ),*/
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.17.sp),
          Text(
            "Welcome to Codeline Management",
            style: TextStyle(
                fontFamily: 'Inter',
                color: AppColor.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp),
          ),
          SizedBox(height: Get.height * 0.015.sp),
          Text(
            "@Copyright 2022",
            style: TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                fontSize: 19.sp),
          ),
        ],
      ),
    );
  }
}
