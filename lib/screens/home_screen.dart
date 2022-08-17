import 'package:codeline_infotech/constant/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [],
      ),
    );
  }
}
