import 'package:codeline_infotech/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class InquiryDetailsScreen extends StatefulWidget {
  const InquiryDetailsScreen({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(right: width * 0.012.w),
            child: Icon(
              Icons.more_vert_outlined,
              size: 20.sp,
              color: AppColor.blackColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
                              "Keval D. Gajera",
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
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.001.h),
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
                    "+91 9988775578",
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
                    "B.C.A",
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
                    "Social Media Ads.",
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
                    "Nevil Vaghasiya",
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
              child: Container(
                height: height * 0.020.h,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: courseItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: height * 0.008.h,
                      crossAxisSpacing: width * 0.006.w,
                      mainAxisSpacing: height * 0.002.h),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = index;
                        });
                      },
                      child: Container(
                        height: height * 0.008.h,
                        width: width * 0.10.w,
                        decoration: BoxDecoration(
                          color: isSelected == index
                              ? AppColor.primaryColor
                              : AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Center(
                          child: Text(
                            "${courseItems[index]}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                                color: isSelected == index
                                    ? Colors.white
                                    : Colors.grey),
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
              padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
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
                      "come after 30 november for demo lecture,call after 29 november...",
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
      ),
    );
  }
}
