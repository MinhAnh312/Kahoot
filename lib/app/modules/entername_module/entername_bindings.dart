
import 'package:get/get.dart';
import 'package:khoot/app/data/provider/entername_provider.dart';
import 'package:khoot/app/data/repository/entername_repository.dart';

import 'entername_controller.dart';


class EnterNameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterNameController(repository: EnterNameRepository(provider: EnterNameProvider())));
  }
}