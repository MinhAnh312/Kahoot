
import 'package:get/get.dart';
import 'package:khoot/app/data/provider/explore_room_provider.dart';
import 'package:khoot/app/data/repository/explore_room_repository.dart';

import 'explore_room_controller.dart';

class ExploreRoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExploreRoomController(repository: ExploreRoomRepository(provider: ExploreRoomProvider())));
  }
}