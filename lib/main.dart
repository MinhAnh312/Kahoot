import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoot/app/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done)
        return GetMaterialApp(
          title: "Khoot",
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.rightToLeft,
          theme: appThemeData,
          getPages: AppPages.pages,
          initialRoute: Routes.LOGIN,
        );
        else return Container(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}
