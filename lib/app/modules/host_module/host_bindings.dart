
import 'package:get/get.dart';
import 'package:khoot/app/data/provider/host_provider.dart';
import 'package:khoot/app/data/repository/host_repository.dart';

import 'host_controller.dart';


class HostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HostController(repository: HostRepository(provider: HostProvider())));
  }
}