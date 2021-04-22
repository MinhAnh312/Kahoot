import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../home_module/home_page.dart';

class LoginController extends GetxController {
  FirebaseAuth auth;
  String msg;

  @override
  void onInit() {
    // TODO: implement onInit
    auth = FirebaseAuth.instance;
    checkLoginFirebase();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    checkLoginFirebase();
    super.onReady();
  }

  void checkLoginFirebase() {
    auth.authStateChanges().listen((User user) async {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Get.off(HomePage());
      }
    });
  }

  Future<String> loginInEmail(String email, String pass) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      print(userCredential.user);
      msg = 'Sucess';
      Get.off(HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "Tài khoản không tồn tại");
        print('No user found for that email.');
        msg = "Tài khoản không tồn tại";
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Sai mật khẩu");
        print('Wrong password provided for that user.');
        msg = "Sai mật khẩu";
      }
    }
  }
}
