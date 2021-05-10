import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:khoot/app/const/const.dart';
import 'package:khoot/app/data/repository/entername_repository.dart';
import 'package:khoot/app/modules/enterroom_module/enterroom_controller.dart';
import 'package:khoot/app/modules/question_module/question_page.dart';

class EnterNameController extends GetxController {
  final EnterNameRepository repository;

  EnterNameController({this.repository});

  String roomId;

  @override
  void onInit() async {
    EnterRoomController controller = Get.find();
    roomId = controller.roomId;
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> joinRoom(String name) async {
    var document = FirebaseFirestore.instance
        .collection(Const.ROOM_COLLECTION)
        .doc(roomId);
    var snapshot = await document.get();
    try {
      var list = snapshot.get("user_join") as List;
      List<UserJoin> listUser = list.map((e) => UserJoin.fromJson(e)).toList();
      bool isExistName =
          listUser.indexWhere((element) => element.name == name) >= 0;
      print(listUser.indexWhere((element) => element.name == name));
      if (!isExistName) {
        document.set({
          "user_join": FieldValue.arrayUnion([
            {"name": name}
          ])
        }, SetOptions(merge: true));
        Get.to(QuestionPage());
      }
      print(snapshot.data());
    } catch (e) {
      document.set({
        "user_join": [
          {"name": name}
        ]
      }, SetOptions(merge: true));
      print(e.toString());
    }
  }
}

class UserJoin {
  String name;

  UserJoin({this.name});

  UserJoin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
