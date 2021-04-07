import 'package:khoot/app/modules/home_module/home_controller.dart';
import 'package:khoot/app/data/provider/home_provider.dart';
import 'package:khoot/app/data/repository/home_repository.dart';
import 'package:get/get.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(repository: HomeRepository(provider: HomeProvider())));
  }
}