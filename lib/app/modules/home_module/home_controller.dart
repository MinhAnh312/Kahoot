import 'package:firebase_auth/firebase_auth.dart';
import 'package:khoot/app/data/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:khoot/app/modules/login_module/login_page.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  FirebaseAuth auth;

  HomeController({this.repository}) {
    auth = FirebaseAuth.instance;
  }

  void loginOut(){
    auth.signOut().then((value) {
      Get.off(LoginPage());
    });
  }

}
