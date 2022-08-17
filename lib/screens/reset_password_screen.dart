import 'package:codeline_infotech/constant/colors.dart';
import 'package:codeline_infotech/screens/all_lang_student_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../widgets/common_button.dart';
import '../widgets/common_textformfeild.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final otp = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              symbol(context),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0.sp),
                    topRight: Radius.circular(40.0.sp),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.006.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "FORGOT",
                            style: TextStyle(
                                color: AppColor.neavyBlueColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                height: 0.8),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.004.h,
                      ),
                      Common_TextFormFeild(
                        obscure: false,
                        validator: (String) {},
                        controller: otp,
                        labelText: "OTP",
                      ),
                      SizedBox(
                        height: height * 0.003.h,
                      ),
                      Common_TextFormFeild(
                        obscure: true,
                        validator: (String) {},
                        controller: newPassword,
                        labelText: "NEW PASSWORD",
                      ),
                      SizedBox(
                        height: height * 0.003.h,
                      ),
                      Common_TextFormFeild(
                        obscure: true,
                        validator: (String) {},
                        controller: confirmPassword,
                        labelText: "CONFIRM PASSWORD",
                      ),
                      SizedBox(
                        height: height * 0.003.h,
                      ),
                      CommonButton(
                        height: height * 0.011.h,
                        width: width * 0.30.w,
                        onPressed: () {
                          Get.to(AllLangStudentList());
                        },
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.005.h,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget symbol(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 2.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.01.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 15.sp,
                    color: AppColor.blackColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.04.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.038.w,
            ),
            child: SvgPicture.asset(
              "assets/images/SplashScreen_Icon.svg",
              fit: BoxFit.fill,
              height: height * 0.033.h,
            ),
          )
        ],
      ),
    );
  }
}
