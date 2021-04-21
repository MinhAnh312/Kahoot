import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:khoot/app/modules/host_module/host_page.dart';

class LoginController extends GetxController {
  FirebaseAuth auth ;

  @override
  void onInit() {
    // TODO: implement onInit
    auth = FirebaseAuth.instance;
    checkLoginFirebase();
    super.onInit();
  }

  void checkLoginFirebase() {
    auth.authStateChanges().listen((User user) async {
      if (user == null) {
        print('User is currently signed out!');
        // UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
        // print(userCredential.user.toString());
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<void> loginInEmail(String email, String pass) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      print(userCredential.user);
      Get.to(HostPage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
