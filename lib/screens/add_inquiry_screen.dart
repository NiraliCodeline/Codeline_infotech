import 'package:codeline_infotech/constant/progress_indicator.dart';
import 'package:codeline_infotech/repo/add_new_Inquiry_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant/colors.dart';
import '../controllers/add_new_Inquiry_controller.dart';
import '../models/req/add_new_Inquiry_req_model.dart';
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
  final educationController = TextEditingController();
  final referenceController = TextEditingController();
  final remarkController = TextEditingController();

  RxBool isLoading = false.obs;

  List<String> courseItems = [
    "C",
    "C++",
    "DART",
    "FLUTTER",
    "UI/UX",
    "Node.js"
  ];

  AddNewInquiryController addNewInquiryController =
      Get.put(AddNewInquiryController());

  List<String> counselledList = ["Nikunj Malani", "Nevil Vaghasiya"];

  CounsellerDropDown() {
    counselledList.forEach((value) {
      addNewInquiryController.counsellerList.add(value);
    });
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime? _dateTime;
  var dateSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CounsellerDropDown();
  }

  AddNewInquiryReqModel addNewInquiryReqModel = AddNewInquiryReqModel();

  Future updateInquiryClick() async {
    FocusScope.of(context).unfocus();

    addNewInquiryReqModel.fullName = stdNameController.text.trim();
    addNewInquiryReqModel.email = emailController.text.trim();
    addNewInquiryReqModel.mobile = mobileNoController.text.trim();
    addNewInquiryReqModel.inquiryDate = dateSelected;
    addNewInquiryReqModel.education = educationController.text.trim();
    addNewInquiryReqModel.reference = referenceController.text.trim();
    addNewInquiryReqModel.course = addNewInquiryController.course;
    addNewInquiryReqModel.status = "pending";
    addNewInquiryReqModel.counselled = addNewInquiryController.counseller;
    addNewInquiryReqModel.remarks = remarkController.text.trim();

    bool result =
        await AddNewInquiryRepo.addNewInquiryrepo(addNewInquiryReqModel);

    if (result == true) {
      print("UPDATE SUCCESSFULLY-------->>>>>>>");
      Get.back(result: {'update': true});
    } else {
      print("UPDATE FAILED-------->>>>>>>");
      Get.snackbar("Message", "Update Failed.....");
    }
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
      body: AbsorbPointer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formkey,
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
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please a Enter';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
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
                    Container(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        controller: mobileNoController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.length != 10) {
                            return 'Mobile Number must be of 10 digit';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage("assets/images/Phone.png"),
                              height: 5,
                              width: 5,
                              //fit: BoxFit.fill,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 19.0.sp, horizontal: 11.0.sp),
                          labelText: 'MOBILE NO.',
                          labelStyle: TextStyle(
                              color: AppColor.secondaryColor,
                              fontSize: 14.sp,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.greyColor),
                            borderRadius: BorderRadius.circular(10.0.sp),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.greyColor),
                            borderRadius: BorderRadius.circular(10.0.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.003.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        DateTime? _newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(3100),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary:
                                      AppColor.primaryColor, // <-- SEE HERE
                                  onPrimary:
                                      AppColor.whiteColor, // <-- SEE HERE
                                  onSurface:
                                      AppColor.blackColor, // <-- SEE HERE
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    primary: AppColor
                                        .primaryColor, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (_newDate != null) {
                          setState(() {
                            _dateTime = _newDate;
                            dateSelected =
                                "${_dateTime!.year}-${_dateTime!.month}-${_dateTime!.day}";
                          });
                        }
                      },
                      child: Container(
                        height: 64,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0.sp),
                            border: Border.all(color: AppColor.secondaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(11.0),
                              child: Image(
                                image: AssetImage("assets/images/Calendar.png"),
                                height: 23.sp,
                                width: 23.sp,
                                //fit: BoxFit.fill,
                              ),
                            ),
                            _dateTime == null
                                ? Text(
                                    'INQUIRY DATE',
                                    style: TextStyle(
                                        color: AppColor.secondaryColor,
                                        fontSize: 14.sp,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    "${_dateTime!.day}-${_dateTime!.month}-${_dateTime!.year}",
                                    style: TextStyle(
                                      color: AppColor.blackColor,
                                      fontSize: 13.sp,
                                      fontFamily: "Inter",
                                      //fontWeight: FontWeight.w400
                                    ),
                                  ),
                          ],
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
                      controller: referenceController,
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
                    GetBuilder(
                      builder: (AddNewInquiryController controller) {
                        return Container(
                          height: height * 0.020.h,
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: courseItems.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisExtent: height * 0.008.h,
                                    crossAxisSpacing: width * 0.006.w,
                                    mainAxisSpacing: height * 0.002.h),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  if (!controller.course
                                      .contains(courseItems[index])) {
                                    print(
                                        "COURSE ADDED-------${courseItems[index]}");
                                    controller.addCourse(courseItems[index]);
                                  } else {
                                    courseItems.forEach((element) {
                                      print("Element---------$element");
                                      if (courseItems[index] == element) {
                                        controller.removeCourse(element);
                                      }
                                    });
                                  }
                                },
                                child: Container(
                                  height: height * 0.008.h,
                                  width: width * 0.10.w,
                                  decoration: BoxDecoration(
                                    color: controller.course
                                            .contains(courseItems[index])
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
                                          color: controller.course
                                                  .contains(courseItems[index])
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.008.h,
                    ),
                    GetBuilder(
                      builder: (AddNewInquiryController counsellerController) {
                        return Container(
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 19.0.sp, horizontal: 11.0.sp),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image(
                                      image:
                                          AssetImage("assets/images/User.png"),
                                      height: 5,
                                      width: 5,
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.greyColor),
                                    borderRadius:
                                        BorderRadius.circular(10.0.sp),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.greyColor),
                                    borderRadius:
                                        BorderRadius.circular(10.0.sp),
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
                                    value:
                                        counsellerController.counsellerSelected,
                                    isExpanded: true,
                                    isDense: true,
                                    onChanged: (newValue) {
                                      //batchController.setSelected(newValue!);
                                      counsellerController.counsellerSelected =
                                          newValue!;
                                      counsellerController.update();
                                      counsellerController.counseller =
                                          newValue;

                                      print(
                                          "NEW Counseller--------------${counsellerController.counseller}");
                                    },
                                    items: counsellerController.counsellerList
                                        .map((valueItem) {
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
                        );
                      },
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
                    isLoading.value
                        ? AppProgressLoader()
                        : CommonButton(
                            height: height * 0.011.h,
                            width: width * 0.30.w,
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                isLoading.value = true;
                                if (stdNameController.text.trim() != "" &&
                                    emailController.text.trim() != "" &&
                                    mobileNoController.text.trim() != "" &&
                                    educationController.text.trim() != "" &&
                                    referenceController.text.trim() != "") {
                                  await updateInquiryClick();
                                  isLoading.value = false;
                                } else {
                                  isLoading.value = false;
                                  Get.snackbar("Message", "Please Enter Value");
                                }
                              }
                            },
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
                ),
              )),
        ),
        absorbing: isLoading.value,
      ),
    );
  }
}
