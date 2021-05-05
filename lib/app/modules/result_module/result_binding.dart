import 'package:khoot/app/modules/result_module/result_controller.dart';
import 'package:khoot/app/data/provider/result_provider.dart';
import 'package:khoot/app/data/repository/result_repository.dart';
import 'package:get/get.dart';


class ResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResultController(repository: ResultRepository(provider: ResultProvider())));
  }
}