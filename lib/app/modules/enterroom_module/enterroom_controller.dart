import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khoot/app/const/const.dart';
import 'package:khoot/app/data/repository/enterroom_repository.dart';
import 'package:get/get.dart';
import 'package:khoot/app/modules/entername_module/entername_page.dart';

class EnterRoomController extends GetxController {
  final EnterRoomRepository repository;

  EnterRoomController({this.repository});
  
  var rooms = ['111111', '222222', '333333', '444444', '555555', '666666'];

  String enterroom(String _roomid) {
      if (_roomid.length < 6) return 'Lack of characters';
      else if (rooms.contains(_roomid)) return 'Sucess';
      else return 'Failed';
  }
  
  String roomKey;

  RxBool isExist = false.obs;

  CollectionReference query =
      FirebaseFirestore.instance.collection(Const.ROOM_COLLECTION);

  Future<bool> getListRoom(String roomID) async {
    QuerySnapshot querySnapshot =
        await query.where("room_id", whereIn: [roomID]).get();
    isExist.value = querySnapshot.size > 0;
    if (isExist.value) {
      this.roomKey = querySnapshot.docs.first.data()['room_key'];
    }
    return isExist.value;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> enterRoom(String roomID) async {
    bool isJoin = await getListRoom(roomID);
    if (isJoin) {
      Get.to(EnterNamePage());
    } else
      Fluttertoast.showToast(msg: "Phòng không đúng");
  }
}
