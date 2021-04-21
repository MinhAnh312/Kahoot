import 'package:khoot/app/data/provider/host_provider.dart';
import 'package:khoot/app/data/repository/host_repository.dart';
import 'package:khoot/app/modules/host_module/host_controller.dart';
import 'package:get/get.dart';

class HostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HostController(repository: HostRepository(provider: HostProvider())));
  }
}