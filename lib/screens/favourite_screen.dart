import 'package:codeline_infotech/constant/colors.dart';
import 'package:codeline_infotech/constant/progress_indicator.dart';
import 'package:codeline_infotech/screens/student_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';

import '../controllers/get_all_fev_student_controller.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({
    Key? key,
  }) : super(key: key);

  GetAllFevStudentController getAllFevStudentController =
      Get.put(GetAllFevStudentController());

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
              padding: EdgeInsets.only(right: width * 0.017.w),
              child: Icon(
                Icons.help_outline,
                size: 22.sp,
                color: AppColor.blackColor,
              ),
            ),
          ],
        ),
        body: GetBuilder(
          builder: (GetAllFevStudentController controller) {
            if (controller.isLoading == true) {
              return AppProgressLoader();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Favourite",
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
                  height: height * 0.005.h,
                ),
                Flexible(
                  child: controller.getAllFevStudentList!.data!.isEmpty
                      ? Center(
                          child: Text(
                            "No Favourite Student",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color:
                                    AppColor.secondaryColor.withOpacity(0.8)),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount:
                              controller.getAllFevStudentList!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final data =
                                controller.getAllFevStudentList!.data![index];

                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: height * 0.003.h),
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.017.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(StudentDetails(
                                            studentId: 12,
                                          ));
                                        },
                                        child: Container(
                                          height: height * 0.02.h,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: height * 0.019.h,
                                                width: width * 0.08.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.sp),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${data.avatar}"),
                                                        fit: BoxFit.fill)),
                                              ),
                                              SizedBox(
                                                width: width * 0.035.sp,
                                              ),
                                              Column(
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
                                                      color:
                                                          AppColor.blackColor,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "Inter",
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: height *
                                                                0.0012.h),
                                                    child: Text(
                                                      "${data.email}",
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Inter",
                                                          color: Color(
                                                              0xff868585)),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${data.joiningDate!.split(" ")[0].split("-")[2]}-${data.joiningDate!.split(" ")[0].split("-")[1]}-${data.joiningDate!.split(" ")[0].split("-")[0]}",
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: "Inter",
                                                        color:
                                                            Color(0xff868585)),
                                                  )
                                                ],
                                              )
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
                                ),
                              ),
                            );
                          },
                        ),
                )
              ],
            );
          },
        ));
  }
}
