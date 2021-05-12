import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:khoot/app/const/const.dart';
import 'package:khoot/app/data/model/question.dart';
import 'package:khoot/app/data/model/user_join.dart';
import 'package:khoot/app/data/repository/host_repository.dart';

class HostController extends GetxController {
  final HostRepository repository;
  final String roomId;

  HostController({this.repository, this.roomId});

  String roomKey;

  RxList<UserJoin> listUser = <UserJoin>[].obs;
  RxString status = Const.PENDING.obs;
  RxString buttonGame = Const.START.obs;
  RxInt indexQuestion = 1.obs;
  RxInt totalQuestion = 99.obs;
  RxList<Question> listQuestion = <Question>[].obs;

  QuerySnapshot snapshot;

  var doc;

  @override
  Future<void> onInit() async {
    snapshot = await FirebaseFirestore.instance
        .collection(Const.ROOM_COLLECTION)
        .where("room_id", whereIn: [roomId]).get();
    roomKey = snapshot.docs.first.id;
    doc = FirebaseFirestore.instance
        .collection(Const.ROOM_COLLECTION)
        .doc(roomKey)
        .snapshots()
        .listen((event) {
      print(event.data());
      RoomInfo roomInfo = RoomInfo.fromJson(event.data());
      listUser.value = roomInfo?.userJoin ?? [];
      status.value = roomInfo.status;
      indexQuestion.value = roomInfo.indexQuestion;
      totalQuestion.value = roomInfo.totalQuestion;
      listQuestion.value = roomInfo.question;
      if (status.value == Const.PENDING) {
        buttonGame.value = Const.START;
      }
      if (status.value == Const.START) {
        buttonGame.value = Const.NEXT_QUESTION;
      }
      if (status.value == Const.NEXT_QUESTION) {
        buttonGame.value = Const.NEXT_QUESTION;
      }
      if (status.value == Const.END) {
        buttonGame.value = Const.END;
      }
    });

    // TODO: implement onInit
    super.onInit();
  }

  void startGame() {
    FirebaseFirestore.instance
        .collection(Const.ROOM_COLLECTION)
        .doc(roomKey)
        .update({"status": Const.START});
  }

  void nextQuestion() {
    int index = indexQuestion.value + 1;
    if (indexQuestion.value <= totalQuestion.value) {
      FirebaseFirestore.instance
          .collection(Const.ROOM_COLLECTION)
          .doc(roomKey)
          .update({
        "index_question": index,
        "status": Const.NEXT_QUESTION
      });
      new Timer(new Duration(milliseconds: 2000), () async {
        FirebaseFirestore.instance
            .collection(Const.ROOM_COLLECTION)
            .doc(roomKey)
            .update({"status": Const.START});
        //resetQuest();
      });

    } else {
      showResult();
    }
  }

  void showResult() {
    FirebaseFirestore.instance
        .collection(Const.ROOM_COLLECTION)
        .doc(roomKey)
        .update({"status": Const.END});
  }
}
