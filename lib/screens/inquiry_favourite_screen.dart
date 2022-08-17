import 'package:codeline_infotech/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DemoLectureScreen extends StatefulWidget {
  const DemoLectureScreen({Key? key}) : super(key: key);

  @override
  State<DemoLectureScreen> createState() => _DemoLectureScreenState();
}

class _DemoLectureScreenState extends State<DemoLectureScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.whiteColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image(
              height: 14.sp,
              width: 154.sp,
              image: AssetImage("assets/images/Vector.png"),
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.010.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_outline,
                size: 20.sp,
                color: AppColor.blackColor,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.003.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Demo Lecture",
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.004.h,
          ),
          Flexible(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.017.w),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.002.h),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: height * 0.0015.h,
                                      ),
                                      Text(
                                        "Keval D. Gajera",
                                        style: TextStyle(
                                          color: AppColor.blackColor,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Inter",
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: height * 0.0012.h),
                                        child: Text(
                                          "kevalgajera@gmail.com",
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              color: Color(0xff868585)),
                                        ),
                                      ),
                                      Text(
                                        "Inquiry Date : 22-11-2021",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            color: Color(0xff868585)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.003.h,
                      ),
                      Divider(
                        height: 2,
                        color: AppColor.secondaryColor,
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
