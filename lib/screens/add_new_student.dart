import 'dart:io';
import 'dart:math';

import 'package:codeline_infotech/constant/api_routes.dart';
import 'package:codeline_infotech/constant/colors.dart';
import 'package:codeline_infotech/controllers/add_new_student_controller.dart';
import 'package:codeline_infotech/models/req/add_new_student_req_model.dart';
import 'package:codeline_infotech/widgets/common_button.dart';
import 'package:codeline_infotech/widgets/common_textformfeild.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../repo/add_new_student_repo.dart';

class AddNewStudentScreen extends StatefulWidget {
  const AddNewStudentScreen({Key? key}) : super(key: key);

  @override
  State<AddNewStudentScreen> createState() => _AddNewStudentScreenState();
}

class _AddNewStudentScreenState extends State<AddNewStudentScreen> {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  final joiningdateController = TextEditingController();
  final addressController = TextEditingController();
  final feesController = TextEditingController();
  final amountController = TextEditingController();

  AddNewStudentController _addNewStudentController =
      Get.put(AddNewStudentController());

  AddNewStudentReqModel addNewStudentReqModel = AddNewStudentReqModel();
  Future updateClick() async {
    FocusScope.of(context).unfocus();
    String? url = await uploadUserImage(
      fileName: "${Random().nextInt(1000)}${_image!.path.split('/').first}",
    );

    print("IMAGE URL-----------1${url}");
    addNewStudentReqModel.avatar = url;

    addNewStudentReqModel.fullName = fullnameController.text.trim();
    addNewStudentReqModel.email = emailController.text.trim();
    addNewStudentReqModel.mobile = mobileNoController.text.trim();
    addNewStudentReqModel.joiningDate = dateSelected;
    addNewStudentReqModel.address = addressController.text.trim();
    addNewStudentReqModel.course = _addNewStudentController.course;
    addNewStudentReqModel.totalFees = feesController.text.trim();
    addNewStudentReqModel.favorite = false;
    addNewStudentReqModel.studentId = 70;

    for (int i = 0; i < _addNewStudentController.batches.length; i++) {
      addNewStudentReqModel.batch.add(Batch(
          batch: _addNewStudentController.batches[i],
          currentBatch: _addNewStudentController.batches[i] ==
                  _addNewStudentController.batchesTime
              ? 1
              : 0));
    }

    print("batch Length: ${addNewStudentReqModel.batch.length}");

    for (int i = 0; i < _addNewStudentController.installments.length; i++) {
      addNewStudentReqModel.installments.add(Installment(
          isDone: false,
          installmentNo: (i + 1),
          amount: _addNewStudentController.installments[i]));
    }

    addNewStudentReqModel.installments.forEach((element) {
      print("amount: ${element.amount}");
      print("installmentNo: ${element.installmentNo}");
      print("isDone: ${element.isDone}");
    });

    bool result = await AddNewStudentRepo.getAllStudents(addNewStudentReqModel);

    if (result == true) {
      print("UPDATE SUCCESSFULLY-------->>>>>>>");
      Get.back(result: {'update': true});
    } else {
      print("UPDATE FAILED-------->>>>>>>");
      Get.snackbar("Message", "Update Failed.....");
    }
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime? _dateTime;

  var dateSelected;

  List<String> batchList = [
    "10 to 12",
    "12 to 2",
    "2 to 4",
    "4 to 6",
  ];

  BatchesDropDown() {
    batchList.forEach((value) {
      _addNewStudentController.batches.add(value);
    });
  }

  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
    print("Image---------${_image}");
  }

  Future<String?> uploadUserImage({String? fileName}) async {
    print(ApiRoutes.dataToken);
    Map<String, String> header = {
      "Authorization": '${ApiRoutes.dataToken}',
      "Content-Type": "multipart/form-data"
    };

    print("FileName:${fileName}");
    dio.FormData formData = new dio.FormData.fromMap({
      "file": await dio.MultipartFile.fromFile(_image!.path,
          filename: _image!.path.split("/").last),
    });
    dio.Response response = await dio.Dio().post("${ApiRoutes.uploadAvatar}",
        data: formData, options: dio.Options(headers: header));

    print("data ${response.data}");

    if (response.data['image_url'] != null) {
      return response.data['image_url'];
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    BatchesDropDown();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List<String> courseItems = [
      "C",
      "C++",
      "DART",
      "FLUTTER",
      "UI/UX",
      "Node.js"
    ];

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.whiteColor,
        leading: IconButton(
            onPressed: () {
              Get.back(result: {'update': false});
              /*String? imageUrl = await uploadUserImage(
                fileName:
                    "${Random().nextInt(1000)}${_image!.path.split('/').first}",
              );
              print("DeleteAvatar URL........${imageUrl}");
              bool result =
                  await DeleteAvatarRepo.deleteAvatar(image_url: imageUrl!);
              if (result) {
                print("DeleteAvatar Done........${imageUrl}");
                Get.back();
              } else {
                print("DeleteAvatar Failed........");
              }*/
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * 0.0265.h,
                      width: width * 0.10.w,
                      //color: Colors.green,
                      child: Stack(
                        children: [
                          Container(
                            height: height * 0.024.h,
                            width: width * 0.10.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp)),
                            child: ClipRect(
                              child: _image == null
                                  ? Image.asset(
                                      "assets/images/person.image.png",
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      _image!,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: getImage,
                              child: Container(
                                height: height * 0.005.h,
                                width: width * 0.04.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.whiteColor,
                                        width: 1.sp),
                                    color: Colors.grey.withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: AppColor.whiteColor,
                                  size: 15.sp,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.005.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                child: Common_TextFormFeild(
                    validator: (String) {},
                    obscure: false,
                    controller: fullnameController,
                    labelText: 'STUDENT FULL NAME',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image(
                        image: AssetImage("assets/images/User.png"),
                        height: 5,
                        width: 5,
                        //fit: BoxFit.fill,
                      ),
                    )),
              ),
              SizedBox(
                height: height * 0.003.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                child: Common_TextFormFeild(
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
                      padding: EdgeInsets.all(11.0),
                      child: Image(
                        image: AssetImage("assets/images/Mail.png"),
                        height: 5,
                        width: 5,
                        //fit: BoxFit.fill,
                      ),
                    )),
              ),
              SizedBox(
                height: height * 0.003.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                child: Common_TextFormFeild(
                    validator: (value) {
                      if (value!.length != 10) {
                        return 'Mobile Number must be of 10 digit';
                      }
                      return null;
                    },
                    obscure: false,
                    controller: mobileNoController,
                    labelText: 'MOBILE NO.',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(11.0),
                      child: Image(
                        image: AssetImage("assets/images/Phone.png"),
                        height: 5,
                        width: 5,
                        //fit: BoxFit.fill,
                      ),
                    )),
              ),
              SizedBox(
                height: height * 0.003.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                child: GestureDetector(
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
                              primary: AppColor.primaryColor, // <-- SEE HERE
                              onPrimary: AppColor.whiteColor, // <-- SEE HERE
                              onSurface: AppColor.blackColor, // <-- SEE HERE
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary:
                                    AppColor.primaryColor, // button text color
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
                                'JOINING DATE',
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
              ),
              SizedBox(
                height: height * 0.003.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                child: Container(
                  child: TextFormField(
                    obscureText: false,
                    controller: addressController,
                    validator: (String) {},
                    maxLines: 5,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(11.0),
                        child: Image(
                          image: AssetImage("assets/images/Visit.png"),
                          height: 5,
                          width: 5,
                          //fit: BoxFit.fill,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 19.0.sp, horizontal: 11.0.sp),
                      labelText: "ADDRESS",
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
                        borderSide: BorderSide(color: AppColor.secondaryColor),
                        borderRadius: BorderRadius.circular(10.0.sp),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.003.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                  child: GetBuilder(
                    builder: (AddNewStudentController batchController) {
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
                                        AssetImage("assets/images/batch2.png"),
                                    height: 3.sp,
                                    width: 3.sp,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.greyColor),
                                  borderRadius: BorderRadius.circular(10.0.sp),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.secondaryColor),
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
                                    "BATCH TIME",
                                    style: TextStyle(
                                        color: AppColor.secondaryColor,
                                        fontSize: 14.sp,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500),
                                  ),
                                  value: batchController.batchSelected,
                                  isExpanded: true,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    //batchController.setSelected(newValue!);
                                    batchController.batchSelected = newValue!;
                                    batchController.update();
                                    batchController.batchesTime = newValue;

                                    print(
                                        "NEW BATCH--------------${batchController.batchesTime}");
                                  },
                                  items:
                                      batchController.batches.map((valueItem) {
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
                  )),
              SizedBox(
                height: height * 0.003.h,
              ),
              Divider(
                thickness: 1,
                color: AppColor.greyColor,
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
              ),
              SizedBox(
                height: height * 0.003.h,
              ),
              GetBuilder(
                builder: (AddNewStudentController controller) {
                  return Padding(
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
                              if (!controller.course
                                  .contains(courseItems[index])) {
                                print(
                                    "COURSE ADDED-------${courseItems[index]}");
                                controller.addCourse(courseItems[index]);
                              } else {
                                removeCourse(index);
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
                                  courseItems[index],
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
                    ),
                  );
                },
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
                      "Total Fees",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.003.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                child: Common_TextFormFeild(
                  validator: (String) {},
                  obscure: false,
                  controller: feesController,
                  labelText: 'FEES',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(11.0),
                    child: Image(
                      image: AssetImage("assets/images/Activity Feed.png"),
                      height: 5,
                      width: 5,
                      //fit: BoxFit.fill,
                    ),
                  ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Installment",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                    ),
                    FloatingActionButton(
                        elevation: 0.0,
                        backgroundColor: AppColor.primaryColor,
                        child: Icon(
                          Icons.add,
                          size: 30.sp,
                          color: AppColor.whiteColor,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.sp)),
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Installment",
                                        style: TextStyle(
                                          color: Color(0xff3F3F3F),
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Inter",
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.003.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02.w),
                                    child: TextFormField(
                                      obscureText: false,
                                      controller: amountController,
                                      // validator: widget.validator,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.currency_rupee_rounded,
                                          color: AppColor.blackColor,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 6.0.sp,
                                            horizontal: 5.0.sp),
                                        labelText: 'Amount',
                                        labelStyle: TextStyle(
                                            color: AppColor.secondaryColor,
                                            fontSize: 13.sp,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w400),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor.blackColor),
                                          borderRadius:
                                              BorderRadius.circular(10.0.sp),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor.greyColor),
                                          borderRadius:
                                              BorderRadius.circular(10.0.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.002.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02.w),
                                    child: MaterialButton(
                                      height: height * 0.008.h,
                                      minWidth: width * 0.09.w,
                                      color: AppColor.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.sp)),
                                      child: Center(
                                        child: Text(
                                          "ADD",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              color: Colors.white),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (amountController.text.trim() !=
                                            "") {
                                          _addNewStudentController
                                              .addInstallment(int.parse(
                                                  amountController.text));
                                          amountController.clear();
                                          Get.back();
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.002.h,
                                  ),
                                ],
                              );
                            },
                          );
                        })
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.003.h,
              ),
              GetBuilder<AddNewStudentController>(
                builder: (AddNewStudentController addNewStudentController) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 0.017.w),
                      child: addNewStudentController.installments.isEmpty
                          ? Container(
                              height: height * 0.020.h,
                              child: Center(
                                child: Text(
                                  "Please Add Installment",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      color: AppColor.secondaryColor
                                          .withOpacity(0.8)),
                                ),
                              ),
                            )
                          : Container(
                              height: height * 0.020.h,
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    addNewStudentController.installments.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisExtent: height * 0.008.h,
                                        crossAxisSpacing: width * 0.006.w,
                                        mainAxisSpacing: height * 0.002.h),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onLongPress: () => removeInstallment(index),
                                    child: Container(
                                      height: height * 0.008.h,
                                      width: width * 0.10.w,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: height * 0.006.h,
                                            width: width * 0.012.w,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.white)),
                                            child: Center(
                                              child: Text(
                                                "${index + 1}",
                                                style: TextStyle(
                                                    fontSize: 9.sp,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Inter",
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.004.w,
                                          ),
                                          Text(
                                            "${addNewStudentController.installments[index]}",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Inter",
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ));
                },
              ),
              SizedBox(
                height: height * 0.003.h,
              ),
              Divider(
                thickness: 1,
                color: AppColor.greyColor,
              ),
              SizedBox(
                height: height * 0.005.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.017.w),
                child: CommonButton(
                  height: height * 0.011.h,
                  width: width * 0.30.w,
                  onPressed: () async {
                    print("DATETIME---------------${dateSelected}");
                    print(
                        "BATCHTIME LENGTH---------------${_addNewStudentController.batches.length}");
                    print(
                        "BATCHTIME VALUE---------------${_addNewStudentController.batches[1]}");

                    int allInstallmentSum = 0;
                    _addNewStudentController.installments.forEach((element) {
                      allInstallmentSum += element;
                    });
                    print("FEES CONTROLLER-1---------${allInstallmentSum}");
                    print("FEES CONTROLLER-2--------${feesController.text}");
                    if (int.parse(feesController.text) == allInstallmentSum) {
                      print("FEES CONTROLLER-0---------");

                      if (_formkey.currentState!.validate()) {
                        if (fullnameController.text.trim() != "" &&
                            emailController.text.trim() != "" &&
                            mobileNoController.text.trim() != "" &&
                            addressController.text.trim() != "" &&
                            feesController.text.trim() != "") {
                          await updateClick();
                        } else {
                          Get.snackbar("Message", "Please Enter Value");
                        }
                      }
                    } else {
                      Get.snackbar(
                          "Message", "Please check Fees and installment");
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
              ),
              SizedBox(
                height: height * 0.004.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void removeInstallment(int index) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
                title: Text("Remove Detail"),
                content: Text("Are you sure?"),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                    ),
                    onPressed: () async {
                      print("Remove........");
                      _addNewStudentController.removeInstallment(index);
                      Get.back();
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                      ),
                    ),
                  )
                ])).then(
      (_) => setState(() {}),
    );
    /*_addNewStudentController.removeInstallment(index);*/
  }

  void removeCourse(int index) {
    // confirmation popup
    _addNewStudentController.removeCourse(index);
  }
}
