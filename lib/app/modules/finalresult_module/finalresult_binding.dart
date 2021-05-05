import 'package:khoot/app/modules/finalresult_module/finalresult_controller.dart';
import 'package:khoot/app/data/provider/finalresult_provider.dart';
import 'package:khoot/app/data/repository/finalresult_respository.dart';
import 'package:get/get.dart';


class FinalResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalResultController(repository: FinalResultRepository(provider: FinalResultProvider())));
  }
}