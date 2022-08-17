import 'package:codeline_infotech/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'constant/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

///init nirali 1234
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: AppColor.whiteColor, // status bar color
    ));
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Codeline Infotech',
            theme: ThemeData.light(),
            home: SplashScreen());
      },
    );
  }
}
