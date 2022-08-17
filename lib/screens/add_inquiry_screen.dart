import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant/colors.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textformfeild.dart';

class AddInquiryScreen extends StatefulWidget {
  const AddInquiryScreen({Key? key}) : super(key: key);

  @override
  State<AddInquiryScreen> createState() => _AddInquiryScreenState();
}

class _AddInquiryScreenState extends State<AddInquiryScreen> {
  final stdNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  final inqiryDateController = TextEditingController();
  final educationController = TextEditingController();
  final textController = TextEditingController();
  final counselledController = TextEditingController();
  final remarkController = TextEditingController();

  String? _bankChoose;

  List<String> bankDataList = ["item 1", "item 2"];

  List<String> courseItems = [
    "C Lang.",
    "C++ Lang.",
    "Dart",
    "Flutter",
    "UI/UX",
    "Node.js"
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.003.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Add Inquiry",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.007.h,
                ),
                Common_TextFormFeild(
                  validator: (String) {},
                  obscure: false,
                  controller: stdNameController,
                  labelText: 'STUDENT FULL NAME',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage("assets/images/User.png"),
                      height: 5,
                      width: 5,
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.003.h,
                ),
                Common_TextFormFeild(
                  validator: (String) {},
                  obscure: false,
                  controller: emailController,
                  labelText: 'EMAIL ADDRESS',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage("assets/images/Mail.png"),
                      height: 5,
                      width: 5,
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.003.h,
                ),
                Common_TextFormFeild(
                  validator: (String) {},
                  obscure: false,
                  controller: mobileNoController,
                  labelText: 'MOBILE NO.',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage("assets/images/Phone.png"),
                      height: 5,
                      width: 5,
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.003.h,
                ),
                Common_TextFormFeild(
                  validator: (String) {},
                  obscure: false,
                  controller: inqiryDateController,
                  labelText: 'INQUIRY DATE',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage("assets/images/Calendar.png"),
                      height: 5,
                      width: 5,
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.003.h,
                ),
                Common_TextFormFeild(
                  validator: (String) {},
                  obscure: false,
                  controller: educationController,
                  labelText: 'EDUCATION DETAILS',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage("assets/images/Graduate.png"),
                      height: 5,
                      width: 5,
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.003.h,
                ),
                Common_TextFormFeild(
                  validator: (String) {},
                  obscure: false,
                  controller: educationController,
                  labelText: 'HOW DID YOU KNOW ABOUT US?',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage("assets/images/Document.png"),
                      height: 5,
                      width: 5,
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.008.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Course",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.004.h,
                ),
                Container(
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
                SizedBox(
                  height: height * 0.008.h,
                ),
                Container(
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 19.0.sp, horizontal: 11.0.sp),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage("assets/images/User.png"),
                              height: 5,
                              width: 5,
                              //fit: BoxFit.fill,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.greyColor),
                            borderRadius: BorderRadius.circular(10.0.sp),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.greyColor),
                            borderRadius: BorderRadius.circular(10.0.sp),
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColor.secondaryColor,
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              //color: text_gray_color,
                              fontFamily: "verdana_regular",
                            ),
                            hint: Text(
                              "COUNSELLED BY",
                              style: TextStyle(
                                  color: AppColor.secondaryColor,
                                  fontSize: 14.sp,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500),
                            ),
                            value: _bankChoose,
                            isExpanded: true,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                _bankChoose = newValue;
                              });
                            },
                            items: bankDataList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(
                                  valueItem,
                                  style: TextStyle(
                                      color: AppColor.secondaryColor,
                                      fontSize: 14.sp,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.003.h,
                ),
                Container(
                  child: TextFormField(
                    maxLines: 5,
                    minLines: 1,
                    obscureText: false,
                    controller: remarkController,
                    // validator: widget.validator,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image(
                          image: AssetImage("assets/images/Document.png"),
                          height: 5,
                          width: 5,
                          //fit: BoxFit.fill,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 19.0.sp, horizontal: 11.0.sp),
                      labelText: "REMARKS",
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
                SizedBox(
                  height: height * 0.004.h,
                ),
                CommonButton(
                  height: height * 0.011.h,
                  width: width * 0.30.w,
                  onPressed: () {},
                  child: Text(
                    "Add & Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.004.h,
                ),
              ],
            )),
      ),
    );
  }
}
