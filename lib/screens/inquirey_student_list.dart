import 'package:codeline_infotech/constant/colors.dart';
import 'package:codeline_infotech/models/req/start_demo_req_model.dart';
import 'package:codeline_infotech/repo/start_demo_repo.dart';
import 'package:codeline_infotech/screens/inquiry_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../constant/progress_indicator.dart';
import '../controllers/get_allInquiry_controller.dart';
import 'add_inquiry_screen.dart';

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

  Future StartDemoClick(var data) async {
    DateTime today = DateTime.now();
    var currentDate = today.day;
    var currentMonth = today.month;
    var currentYear = today.year;

    var startDate = "${currentYear}-${currentMonth}-${currentDate}";

    print("CURRENT DATE------${startDate}");

    DateTime dayOfFutureDate = today.add(Duration(days: 3));
    var futureDate = dayOfFutureDate.day;
    var futureMonth = dayOfFutureDate.month;
    var futureYear = dayOfFutureDate.year;

    var endDate = "${futureYear}-${futureMonth}-${futureDate}";

    print("FUTURE DATE------${endDate}");

    StartDemoReqModel startDemoReqModel = StartDemoReqModel();
    startDemoReqModel.inquiryId = int.parse(data.inquiryId!);
    startDemoReqModel.startDate = startDate;
    startDemoReqModel.endDate = endDate;

    await StartDemoRepo.startDemorepo(startDemoReqModel);
  }

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
              Get.back(result: {'update': true});
            },
            icon: Image(
              height: 14.sp,
              width: 154.sp,
              image: AssetImage("assets/images/Vector.png"),
            )),
        actions: [
          IconButton(
              onPressed: () {
                //Get.to(DemoLectureScreen());
              },
              icon: Image(
                height: 20.sp,
                width: 20.sp,
                image: AssetImage("assets/images/Training.png"),
              )),
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
                    onChanged: onSearchTextChanged,
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
                  child: getAllInquiryController.searchResult.isNotEmpty ||
                          searchController.text.isNotEmpty
                      ? getAllInquiryController.searchResult.isEmpty
                          ? Center(
                              child: Text(
                                "No Student Found",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Inter",
                                    color: AppColor.secondaryColor
                                        .withOpacity(0.8)),
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.searchResult.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                DateTime? now =
                                    controller.searchResult[index].inquiryDate;
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(now!);

                                var value = controller.searchResult[index];

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.017.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(InquiryDetailsScreen(
                                            inquiryId:
                                                int.parse(value.inquiryId!),
                                          ));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          color: Colors.transparent,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: height * 0.002.h),
                                                child: Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            height * 0.0015.h,
                                                      ),
                                                      Text(
                                                        "${value.fullName}",
                                                        style: TextStyle(
                                                          color: AppColor
                                                              .blackColor,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: "Inter",
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    height *
                                                                        0.0012
                                                                            .h),
                                                        child: Text(
                                                          "${value.email}",
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  "Inter",
                                                              color: Color(
                                                                  0xff868585)),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Inquiry Date : ${DateFormat('dd-MM-yyyy').format((value.inquiryDate)!)}",
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: "Inter",
                                                            color: Color(
                                                                0xff868585)),
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
                            )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: getAllInquiryController
                              .allInquiryStudentList!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = getAllInquiryController
                                .allInquiryStudentList!.data![index];
                            return Dismissible(
                              key: ValueKey(data),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (DismissDirection direction) {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                            title: Text("Add To Demo"),
                                            content: Text("Are you sure?"),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Inter",
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  Get.back();
                                                  getAllInquiryController
                                                      .isLoading = true.obs;

                                                  await StartDemoClick(data);

                                                  setState(() {
                                                    getAllInquiryController
                                                        .allInquiryStudentList!
                                                        .data!
                                                        .removeAt(index);
                                                  });
                                                  getAllInquiryController
                                                      .isLoading = false.obs;
                                                },
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                    color: AppColor.primaryColor
                                                        .withOpacity(0.5),
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Inter",
                                                  ),
                                                ),
                                              )
                                            ]));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.017.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(InquiryDetailsScreen(
                                          inquiryId: int.parse(data.inquiryId!),
                                        ));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                      "Inquiry Date : ${DateFormat('dd-MM-yyyy').format((data.inquiryDate)!)}",
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Inter",
                                                          color: Color(
                                                              0xff868585)),
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
                              ),
                            );
                          },
                        ))
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
            Get.to(AddInquiryScreen())!.then((value) {
              if (value['update']) getAllInquiryController.onInit();

              print("Get new InquiryAPI calls");
            });
          }),
    );
  }

  onSearchTextChanged(String text) async {
    getAllInquiryController.searchResult.clear();
    if (text.isEmpty) {
      getAllInquiryController.update();
      return;
    }

    for (var userDetail
        in getAllInquiryController.allInquiryStudentList!.data!) {
      print("userDetail.fullName ${userDetail.fullName}");
      print("text $text");

      //userDetail.fullName!.split(" ")[0].toLowerCase().contains(text.toLowerCase())
      //userDetail.fullName!.split(" ")[0].toLowerCase().contains(text.toLowerCase())

      String firstName = userDetail.fullName!.split(" ")[0];

      String lastName = userDetail.fullName!.split(" ").length > 1
          ? userDetail.fullName!.split(" ")[1]
          : "";

      if (firstName.toLowerCase().contains(text.toLowerCase()) ||
          lastName.toLowerCase().contains(text.toLowerCase())) {
        getAllInquiryController.addSearchResult(userDetail);
      } else {
        getAllInquiryController.update();
      }
    }
  }
}
