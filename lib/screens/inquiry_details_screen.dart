import 'package:codeline_infotech/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../constant/progress_indicator.dart';
import '../controllers/get_Inquiry_details_controller.dart';

class InquiryDetailsScreen extends StatefulWidget {
  InquiryDetailsScreen({Key? key, required this.inquiryId}) : super(key: key);

  final int inquiryId;

  @override
  State<InquiryDetailsScreen> createState() => _InquiryDetailsScreenState();
}

class _InquiryDetailsScreenState extends State<InquiryDetailsScreen> {
  List<String> courseItems = [
    "C Lang.",
    "C++ Lang.",
    "Dart",
    "Flutter",
  ];

  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    GetInquiryDetailsController getInquiryDetailsController =
        Get.put(GetInquiryDetailsController(widget.inquiryId));

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
            padding: EdgeInsets.only(right: width * 0.008.w),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_outlined,
                  size: 20.sp,
                  color: AppColor.blackColor,
                )),
          ),
        ],
      ),
      body: GetBuilder<GetInquiryDetailsController>(
        builder: (controller) {
          if (controller.isLoading == true) {
            return AppProgressLoader();
          }
          final tagName = getInquiryDetailsController
              .allInquiryDetailsList!.inquiryDetails![0].course;
          print("TAGNAME---------------------${tagName}");
          final course = tagName!.split(',');
          print("COURSE---------------------${course}");
          print(
              "------------------${getInquiryDetailsController.allInquiryDetailsList!.inquiryDetails![0].fullName}");
          var data = getInquiryDetailsController
              .allInquiryDetailsList!.inquiryDetails![0];
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.003.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Inquiry Details",
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
                      height: height * 0.002.h,
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColor.greyColor,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.0015.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: Color(0xffE5E5E5),
                                    width: 1.0, // Underline thickness
                                  ))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.001.h),
                                    child: Text(
                                      "${data.fullName}",
                                      style: TextStyle(
                                        color: AppColor.blackColor,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Inter",
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 0.001.h),
                                  child: Text(
                                    "${data.email}",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Inter",
                                        color: Color(0xff868585)),
                                  ),
                                ),
                                Text(
                                  "Inquiry Date : ${DateFormat('dd-MM-yyyy').format((data.inquiryDate)!)}",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      color: Color(0xff868585)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.003.h,
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColor.greyColor,
                    ),
                    SizedBox(
                      height: height * 0.003.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Student Details",
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.002.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Mobile No   :",
                            style: TextStyle(
                              color: Color(0xff3F3F3F),
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          ),
                          SizedBox(
                            width: width * 0.006.w,
                          ),
                          Text(
                            "${data.mobile}",
                            style: TextStyle(
                              color: Color(0xff868585),
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.0015.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Education   :",
                            style: TextStyle(
                              color: Color(0xff3F3F3F),
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          ),
                          SizedBox(
                            width: width * 0.006.w,
                          ),
                          Text(
                            "${data.education}",
                            style: TextStyle(
                              color: Color(0xff868585),
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.0015.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Reference   :",
                            style: TextStyle(
                              color: Color(0xff3F3F3F),
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          ),
                          SizedBox(
                            width: width * 0.006.w,
                          ),
                          Text(
                            "${data.reference}",
                            style: TextStyle(
                              color: Color(0xff868585),
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.0015.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Counselled :",
                            style: TextStyle(
                              color: Color(0xff3F3F3F),
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          ),
                          SizedBox(
                            width: width * 0.006.w,
                          ),
                          Text(
                            "${data.counselled}",
                            style: TextStyle(
                              color: Color(0xff868585),
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColor.greyColor,
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Courses Details",
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Container(
                        height: height * 0.020.h,
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: course.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: height * 0.008.h,
                                  crossAxisSpacing: width * 0.006.w,
                                  mainAxisSpacing: height * 0.002.h),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: height * 0.008.h,
                                width: width * 0.10.w,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                child: Center(
                                  child: Text(
                                    "${course[index]}",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Inter",
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColor.greyColor,
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Inquiry Status",
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: height * 0.0083.h,
                            width: width * 0.13.w,
                            decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(10.sp),
                                border: Border.all(color: Color(0xffFF9900))),
                            child: Center(
                              child: Text(
                                "Pending",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Inter",
                                    color: Color(0xffFF9900)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColor.greyColor,
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Remark",
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Container(
                        height: height * 0.013.h,
                        width: width.w,
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(6.sp),
                            border: Border.all(color: Color(0xffD9D9D9))),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Text(
                              "${data.remarks}",
                              style: TextStyle(
                                  height: 0.17.h,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Inter",
                                  color: Color(0xff868585)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.004.h,
                    ),
                  ],
                ),
                controller.isLoading == true
                    ? Container(
                        color: Colors.white.withOpacity(0.8),
                        child: Center(
                          child: AppProgressLoader(),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
