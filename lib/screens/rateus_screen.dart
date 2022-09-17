import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../constant/colors.dart';

class RateUsScreen extends StatefulWidget {
  const RateUsScreen({Key? key}) : super(key: key);

  @override
  State<RateUsScreen> createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.13,
          ),
          Center(
            child: Image(
              image: AssetImage("assets/images/codeline_text_black_logo 1.png"),
              fit: BoxFit.fill,
              height: Get.height * 0.13,
              width: Get.width * 0.78,
            ),
          ),
          Stack(
            children: [
              Divider(
                color: AppColor.greyColor,
                indent: 30.0,
                endIndent: 30.0,
                thickness: 1.3,
              ),
              Divider(
                color: AppColor.primaryColor,
                indent: 120.0,
                endIndent: 120.0,
                thickness: 1.3,
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Image(
            image: AssetImage("assets/images/BarcodeImage.png"),
            fit: BoxFit.fill,
            height: Get.height * 0.3,
            width: Get.width * 0.62,
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Text(
            "TELL US ABOUT YOUR EXPERIENCE",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Radley",
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star_rounded,
              color: AppColor.primaryColor,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Image(
            image: AssetImage("assets/images/GoogleText.png"),
            fit: BoxFit.fill,
            height: Get.height * 0.08,
            width: Get.width * 0.5,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            "REVIEWS",
            style: TextStyle(
              letterSpacing: Get.width * 0.02,
              color: Color(0xff353535),
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "Roboto",
            ),
          ),
        ],
      ),
    );
  }
}
