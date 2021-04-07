import 'package:khoot/app/modules/login_module/login_controller.dart';
import 'package:khoot/app/data/provider/login_provider.dart';
import 'package:khoot/app/data/repository/login_repository.dart';
import 'package:get/get.dart';


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(repository: LoginRepository(provider: LoginProvider())));
  }
}