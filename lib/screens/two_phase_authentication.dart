import 'package:codeline_infotech/constant/colors.dart';
import 'package:codeline_infotech/screens/all_lang_student_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../constant/progress_indicator.dart';
import '../repo/two_phase_authentication_repo.dart';
import '../widgets/common_button.dart';

class TwoPhaseAuthentication extends StatelessWidget {
  TwoPhaseAuthentication({Key? key, required this.token, required this.role})
      : super(key: key);

  final String token;
  final String role;

  final verificationController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Obx(
        () => AbsorbPointer(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formkey,
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
                                "2 Phase Code",
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
                          Container(
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(7),
                              ],
                              controller: verificationController,
                              validator: (value) {
                                if (value!.length != 7) {
                                  return 'Code must be of 7 digit';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 17.0.sp, horizontal: 11.0.sp),
                                hintText: "SECRET CODE",
                                hintStyle: TextStyle(
                                    color: AppColor.secondaryColor,
                                    fontSize: 14.sp,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.greyColor),
                                  borderRadius: BorderRadius.circular(10.0.sp),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.greyColor),
                                  borderRadius: BorderRadius.circular(10.0.sp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.004.h,
                          ),
                          isLoading.value
                              ? AppProgressLoader()
                              : CommonButton(
                                  height: height * 0.011.h,
                                  width: width * 0.30.w,
                                  onPressed: () async {
                                    if (_formkey.currentState!.validate()) {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      isLoading.value = true;
                                      var result =
                                          await TwoPhaseAuthenticationRepo
                                              .twoPhaseAuthMethod(
                                                  code: verificationController
                                                      .text
                                                      .trim());
                                      /* await Future.delayed(
                                          Duration(minutes: 5));*/
                                      if (result["verify_code"] == 1) {
                                        GetStorage().write('token', token);
                                        GetStorage().write("role", role);
                                        Get.offAll(AllLangStudentList());
                                      } else {
                                        isLoading.value = false;
                                        print("Wrong verified");
                                        Get.snackbar("2 Phase Code",
                                            "Please valid verified code");
                                      }
                                    }
                                  },
                                  child: Text(
                                    "Verification",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: height * 0.04.h,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          absorbing: isLoading.value,
        ),
      )),
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
