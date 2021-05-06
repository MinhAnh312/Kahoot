import 'package:khoot/app/data/repository/enterroom_repository.dart';
import 'package:get/get.dart';


class EnterRoomController extends GetxController{

  final EnterRoomRepository repository;

  EnterRoomController({this.repository});

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  var rooms = ['111111', '222222', '333333', '444444', '555555', '666666'];

  String enterroom(String _roomid) {
      if (_roomid.length < 6) return 'Lack of characters';
      else if (rooms.contains(_roomid)) return 'Sucess';
      else return 'Failed';
  }
}
