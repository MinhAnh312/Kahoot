import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:khoot/app/const/const.dart';
import 'package:khoot/app/data/model/question.dart';
import 'package:khoot/app/data/model/user_join.dart';
import 'package:khoot/app/data/repository/explore_room_repository.dart';

class ExploreRoomController extends GetxController {
  final ExploreRoomRepository repository;

  ExploreRoomController({this.repository});

  final query =
      FirebaseFirestore.instance.collection(Const.QUESTION_COLLECTION);

  final room = FirebaseFirestore.instance.collection(Const.ROOM_COLLECTION);

  RxList<Question> listQuestion = <Question>[].obs;
  RxList<Question> totalQuestion = <Question>[].obs;
  RxList<RoomInfo> listRoom = <RoomInfo>[].obs;
  RxBool isCreateHost = false.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await getListRoom();
    await getListQuestion();
    super.onInit();
  }

  Future<void> getListQuestion() async {
    QuerySnapshot snapshot = await query.get();
    snapshot.docs.forEach((element) {
      totalQuestion.add(Question.fromJson(element.data()));
    });
  }

  Future<void> getListRoom() async {
    QuerySnapshot snapshot = await room.get();
    snapshot.docs.forEach((element) {
      listRoom.add(RoomInfo.fromJson(element.data()));
    });
  }

  void createHost(){
    isCreateHost.value = true;
  }

  void checkHost(){
    isCreateHost.value = false;
  }

  void addQuestion(Question question) {
    listQuestion.add(question);
  }

  Future<String> createRoom(String name, String description) async {
    String error = "";
    DocumentReference ref = room.doc();
    var query = await room.where("room_id", whereIn: [name]).get();
    int length = query.docs.length;
    if (length == 0) {
      if (listQuestion.length == 0) {
        error = "Bạn phải chọn câu hỏi";
      } else if (name == null) {
        error = "Bạn phải đặt tên phòng";
      } else {
        ref.set(RoomInfo(
                indexQuestion: 1,
                totalQuestion: listQuestion.length,
                status: "pending",
                roomKey: ref.id,
                roomId: name,
                description: description,
                question: listQuestion.toJson())
            .toJson());
      }
    } else if (length > 0) {
      error = "Phòng này đã tồn tại";
    }
    return error;
  }

  void removeQuestion(Question question) {
    listQuestion.remove(question);
  }
}
