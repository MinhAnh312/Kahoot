import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoot/app/modules/login_module/login_page.dart';
import 'package:khoot/app/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Khoot",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      theme: appThemeData,
      home: LoginPage(),
    );
  }
}
