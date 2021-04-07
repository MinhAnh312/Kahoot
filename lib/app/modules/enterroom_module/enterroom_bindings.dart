import 'package:khoot/app/modules/enterroom_module/enterroom_controller.dart';
import 'package:khoot/app/data/provider/enterroom_provider.dart';
import 'package:khoot/app/data/repository/enterroom_repository.dart';
import 'package:get/get.dart';


class EnterRoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterRoomController(repository: EnterRoomRepository(provider: EnterRoomProvider())));
  }
}