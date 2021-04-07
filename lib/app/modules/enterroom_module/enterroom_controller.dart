import 'package:khoot/app/data/repository/enterroom_repository.dart';
import 'package:get/get.dart';


class EnterRoomController extends GetxController{

  final EnterRoomRepository repository;

  EnterRoomController({this.repository});

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
