import 'package:firebase_auth/firebase_auth.dart';
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth.instance;


  // void checkLoginFirebase() {
  //   auth.authStateChanges().listen((User user) async {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //     }
  //   });
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   checkLoginFirebase();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done)
        return StreamBuilder<User>(
          stream: auth.authStateChanges(),
          builder: (context, snapshot) {
            return GetMaterialApp(
              title: "Khoot",
              debugShowCheckedModeBanner: false,
              defaultTransition: Transition.rightToLeft,
              theme: appThemeData,
              getPages: AppPages.pages,
              initialRoute: Routes.LOGIN,
            );
          }
        );
        else return Container(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}
