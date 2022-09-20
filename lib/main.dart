import 'package:fake_news_detector/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHomePage(
            pageIndex: 0,
          ),
        );
      }),
    );
  }
}
