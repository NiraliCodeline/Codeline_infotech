import 'package:codeline_infotech/constant/colors.dart';
import 'package:codeline_infotech/screens/add_inquiry_screen.dart';
import 'package:codeline_infotech/screens/inquiry_details_screen.dart';
import 'package:codeline_infotech/screens/inquiry_favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../constant/progress_indicator.dart';
import '../controllers/get_allInquiry_controller.dart';

class InquiryStudentListScreen extends StatefulWidget {
  InquiryStudentListScreen({Key? key}) : super(key: key);

  @override
  State<InquiryStudentListScreen> createState() =>
      _InquiryStudentListScreenState();
}

class _InquiryStudentListScreenState extends State<InquiryStudentListScreen> {
  final searchController = TextEditingController();

  GetAllInquiryController getAllInquiryController =
      Get.put(GetAllInquiryController());

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
          IconButton(
              onPressed: () {
                Get.to(DemoLectureScreen());
              },
              icon: Image(
                height: 20.sp,
                width: 20.sp,
                image: AssetImage("assets/images/Training.png"),
              )),
          Padding(
            padding: EdgeInsets.only(right: width * 0.010.w),
            child: IconButton(
              onPressed: () {
                Get.to(InquiryDetailsScreen());
              },
              icon: Icon(
                Icons.help_outline,
                size: 20.sp,
                color: AppColor.blackColor,
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<GetAllInquiryController>(
        builder: (controller) {
          if (controller.isLoading == true) {
            return AppProgressLoader();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.003.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                child: Container(
                  child: TextFormField(
                    obscureText: false,
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Image(
                          image: AssetImage("assets/images/icons.png"),
                          height: 5,
                          width: 5,
                          //fit: BoxFit.fill,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Image(
                          image: AssetImage("assets/images/Slider.png"),
                          height: 5,
                          width: 5,
                          //fit: BoxFit.fill,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 17.0.sp, horizontal: 11.0.sp),
                      labelText: "Search Student",
                      labelStyle: TextStyle(
                          color: AppColor.secondaryColor,
                          fontSize: 14.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.blackColor),
                        borderRadius: BorderRadius.circular(10.0.sp),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.greyColor),
                        borderRadius: BorderRadius.circular(10.0.sp),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.004.h,
              ),
              Flexible(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: getAllInquiryController
                      .allInquiryStudentList!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = getAllInquiryController
                        .allInquiryStudentList!.data![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.017.w),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              //color: Colors.orange,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.002.h),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: height * 0.0015.h,
                                          ),
                                          Text(
                                            "${data.fullName}",
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
                                  ),
                                ],
                              ),
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
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            Icons.add,
            size: 30.sp,
            color: AppColor.whiteColor,
          ),
          onPressed: () {
            Get.to(AddInquiryScreen());
          }),
    );
  }
}
