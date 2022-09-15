import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant/colors.dart';
import '../controllers/internet_connectivity_controller.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen(
      {Key? key,
      required this.totalFees,
      required this.totalDepositFees,
      required this.totalPendingFees})
      : super(key: key);

  final totalFees;
  final totalDepositFees;
  final totalPendingFees;

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  ConnectivityProvider connectivityController = Get.put(ConnectivityProvider());

  @override
  void initState() {
    super.initState();
    connectivityController.startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<ConnectivityProvider>(
      builder: (controller) {
        return controller.isOnline
            ? Scaffold(
                backgroundColor: AppColor.whiteColor,
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: AppColor.whiteColor,
                  leading: IconButton(
                      onPressed: () {
                        Get.back(result: {'update': false});
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
                            Icons.help_outline,
                            size: 22.sp,
                            color: AppColor.blackColor,
                          )),
                    ),
                  ],
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Text(
                        "Total Fees",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      height: 10.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                              color: AppColor.primaryColor, width: 2.sp)),
                      child: Center(
                        child: Text(
                          "${widget.totalFees}",
                          style: TextStyle(
                            color: Color(0xff868585),
                            fontSize: 3.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Text(
                        "Total Deposit Fees",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      height: 10.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                              color: AppColor.primaryColor, width: 2.sp)),
                      child: Center(
                        child: Text(
                          "${widget.totalDepositFees}",
                          style: TextStyle(
                            color: Color(0xff868585),
                            fontSize: 3.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: Text(
                        "Total Pending Fees",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      height: 10.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                              color: AppColor.primaryColor, width: 2.sp)),
                      child: Center(
                        child: Text(
                          "${widget.totalPendingFees}",
                          style: TextStyle(
                            color: Color(0xff868585),
                            fontSize: 3.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
            : Scaffold(
                body: Center(
                  child: Text(
                    "No Internet..",
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              );
      },
    );
  }
}
