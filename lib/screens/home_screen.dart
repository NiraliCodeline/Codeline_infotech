import 'package:codeline_infotech/constant/colors.dart';
import 'package:codeline_infotech/screens/all_lang_student_list.dart';
import 'package:codeline_infotech/screens/demo_lecture_screen.dart';
import 'package:codeline_infotech/screens/favourite_screen.dart';
import 'package:codeline_infotech/screens/inquirey_student_list.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import '../controllers/get_dashboard_details_controller.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetDashboardDetailsController getDashboardDetailsController =
      Get.put(GetDashboardDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.backgroundColor,
        iconTheme: IconThemeData(color: AppColor.blackColor),
      ),
      drawer: MyDrawer(),
      body: GetBuilder<GetDashboardDetailsController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/SplashScreen_Icon.svg",
                    fit: BoxFit.fill,
                    height: 125.sp,
                    width: 188.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 22.sp,
              ),
              Container(
                width: double.infinity,
                height: 393.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0.sp),
                    topRight: Radius.circular(40.0.sp),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.sp),
                          child: Text(
                            "Welcome, Admin",
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 80.sp,
                                width: 80.sp,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColor.primaryColor,
                                        width: 4.2.sp)),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/012-girl 1.png",
                                    fit: BoxFit.fill,
                                    height: 40.sp,
                                    width: 40.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 9.sp,
                              ),
                              Countup(
                                begin: 0,
                                end: getDashboardDetailsController
                                    .allDashboardDetailsList!.totalStudent!
                                    .toDouble(),
                                duration: Duration(milliseconds: 2500),
                                separator: ',',
                                style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Text(
                                "Total Student",
                                style: TextStyle(
                                  color: Color(0xff868585),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Text(
                                "Count",
                                style: TextStyle(
                                  color: Color(0xff868585),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 80.sp,
                                width: 80.sp,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColor.primaryColor,
                                        width: 4.2.sp)),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/029-survey 1.png",
                                    fit: BoxFit.fill,
                                    height: 40.sp,
                                    width: 40.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 9.sp,
                              ),
                              Countup(
                                begin: 0,
                                end: getDashboardDetailsController
                                    .allDashboardDetailsList!.totalInquiry!
                                    .toDouble(),
                                duration: Duration(milliseconds: 2500),
                                separator: ',',
                                style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Text(
                                "Total Student",
                                style: TextStyle(
                                  color: Color(0xff868585),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Text(
                                "Inquiry",
                                style: TextStyle(
                                  color: Color(0xff868585),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 80.sp,
                                width: 80.sp,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColor.primaryColor,
                                        width: 4.2.sp)),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/001-desk 1.png",
                                    fit: BoxFit.fill,
                                    height: 40.sp,
                                    width: 40.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 9.sp,
                              ),
                              Countup(
                                begin: 0,
                                end: getDashboardDetailsController
                                    .allDashboardDetailsList!.currentDemo!
                                    .toDouble(),
                                duration: Duration(milliseconds: 2500),
                                separator: ',',
                                style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Text(
                                "Current Demo",
                                style: TextStyle(
                                  color: Color(0xff868585),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Text(
                                "Student",
                                style: TextStyle(
                                  color: Color(0xff868585),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 80.sp,
                                width: 80.sp,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColor.primaryColor,
                                        width: 4.2.sp)),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/026-favourite 1.png",
                                    fit: BoxFit.fill,
                                    height: 40.sp,
                                    width: 40.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 9.sp,
                              ),
                              Countup(
                                begin: 0,
                                end: getDashboardDetailsController
                                    .allDashboardDetailsList!.completedStudent!
                                    .toDouble(),
                                duration: Duration(milliseconds: 2500),
                                separator: ',',
                                style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Text(
                                "Completed",
                                style: TextStyle(
                                  color: Color(0xff868585),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Text(
                                "Student",
                                style: TextStyle(
                                  color: Color(0xff868585),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200.sp,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff17A2B8),
                Color(0xff232C42),
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.sp,
                ),
                Container(
                  height: 100.sp,
                  width: 100.sp,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColor.whiteColor, width: 5.sp),
                      image: DecorationImage(
                          image: AssetImage("assets/images/Ellipse 164.png"),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Mr. Nevil Vaghasiya",
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter",
                  ),
                ),
                SizedBox(
                  height: 3.sp,
                ),
                Text(
                  "( Super Admin )",
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 23.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.sp),
            child: ListTile(
              onTap: () {
                Get.back();
                Get.to(HomeScreen());
              },
              leading: Image(
                  image: AssetImage("assets/images/Combo Chart.png"),
                  fit: BoxFit.fill,
                  height: 26.sp,
                  width: 26.sp),
              title: Text(
                "Dashboard",
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.sp, right: 40.sp),
            child: Divider(
              height: 2,
              color: AppColor.secondaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.sp),
            child: ListTile(
              onTap: () {
                Get.back();
                Get.to(AllLangStudentList());
              },
              leading: Image(
                  image: AssetImage("assets/images/Graduate_Drawer.png"),
                  fit: BoxFit.fill,
                  height: 26.sp,
                  width: 26.sp),
              title: Text(
                "Student List",
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.sp, right: 40.sp),
            child: Divider(
              height: 2,
              color: AppColor.secondaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.sp),
            child: ListTile(
              onTap: () {
                Get.back();
                Get.to(InquiryStudentListScreen());
              },
              leading: Image(
                  image: AssetImage("assets/images/Survey.png"),
                  fit: BoxFit.fill,
                  height: 26.sp,
                  width: 26.sp),
              title: Text(
                "Inquiry List",
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.sp, right: 40.sp),
            child: Divider(
              height: 2,
              color: AppColor.secondaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.sp),
            child: ListTile(
              onTap: () {
                Get.back();
                Get.to(FavouriteScreen());
              },
              leading: Image(
                  image: AssetImage("assets/images/Favorite Database.png"),
                  fit: BoxFit.fill,
                  height: 26.sp,
                  width: 26.sp),
              title: Text(
                "Favourite Student",
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.sp, right: 40.sp),
            child: Divider(
              height: 2,
              color: AppColor.secondaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.sp),
            child: ListTile(
              onTap: () {
                Get.back();
                Get.to(DemoLectureScreen());
              },
              leading: Image(
                  image: AssetImage("assets/images/Classroom.png"),
                  fit: BoxFit.fill,
                  height: 26.sp,
                  width: 26.sp),
              title: Text(
                "Current Demo List",
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.sp, right: 40.sp),
            child: Divider(
              height: 2,
              color: AppColor.secondaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.sp),
            child: ListTile(
              onTap: () async {
                await GetStorage().remove('token');
                Get.offAll(LogInScreen());
              },
              leading: Image(
                  image: AssetImage("assets/images/Shutdown.png"),
                  fit: BoxFit.fill,
                  height: 26.sp,
                  width: 26.sp),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.sp, right: 40.sp),
            child: Divider(
              height: 2,
              color: AppColor.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
