import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khoot/app/const/const.dart';
import 'package:khoot/app/data/model/question.dart';
import 'package:khoot/app/data/model/user_join.dart';
import 'package:khoot/app/data/repository/question_repository.dart';
import 'package:get/get.dart';
import 'package:khoot/app/modules/entername_module/entername_controller.dart';
import 'package:khoot/app/modules/enterroom_module/enterroom_controller.dart';
import 'package:khoot/app/modules/result_module/result_page.dart';
import 'package:khoot/app/utils/util.dart';
import 'package:logger/logger.dart';

class QuestionController extends GetxController {
  final QuestionRepository repository;

  QuestionController({this.repository});

  Timer _timer;

  RxInt start = 20.obs;
  RxInt totalQuestion = 5.obs;
  RxInt questionIndex = 0.obs;
  RxInt result = 0.obs;

  String roomId;
  bool firstQuestion = true;

  var doc;

  var roomQuery = FirebaseFirestore.instance.collection(Const.ROOM_COLLECTION);

  RxList<Question> listQuestion = <Question>[].obs;
  RxList<UserJoin> listUser = <UserJoin>[].obs;
  Question question = Question();
  Rx<RoomInfo> room = RoomInfo().obs;

  RxList<String> choose = <String>[].obs;

  String answer = "2";
  RxString status = "pending".obs;
  RxInt indexChoose;
  RxBool isTrue;
  RxInt score = 0.obs;

  Future<void> getListQuestion() async {
    var querySnapshot = await roomQuery.doc(roomId).get();
    Logger().d(querySnapshot.data());
    room.value = RoomInfo.fromJson(querySnapshot.data());
    listQuestion.value = room.value.question;
  }

  void getQuestion() {
    start = 20.obs;
    indexChoose = 99.obs;
    isTrue = false.obs;
    question = listQuestion[questionIndex.value - 1];
    choose.clear();
    choose.add(question.answer);
    choose.add(question.wrongAnswer1);
    choose.add(question.wrongAnswer2);
    choose.add(question.wrongAnswer3);
    answer = question.answer;
    shuffle(choose);
    print(choose);
    print(answer);
    startTimer();
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    EnterRoomController controller = Get.find();
    roomId = controller.roomKey;
    await getListQuestion();
    doc = roomQuery.doc(roomId).snapshots().listen((event) {
      room.value = RoomInfo.fromJson(event.data());
      listUser.value = room.value.userJoin;
      totalQuestion.value = room.value.totalQuestion;
      status.value = room.value.status;
      if ((status.value == Const.START &&
          questionIndex.value < room.value.indexQuestion)) {
        questionIndex.value = room.value.indexQuestion;
        getQuestion();
      }
    });
    super.onInit();
  }

  void resetQuest() {
    if (questionIndex.value < totalQuestion.value) {
      getQuestion();
    } else
      stop();
  }

  List shuffle(List items) {
    var random = new Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    if (!Util.isEmpty(_timer)) {
      _timer.cancel();
    }
    super.onClose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          isShowResult(score: 0);
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  void chooseAnswer(int index) {
    indexChoose.value = index;
    int score = start.value;
    start.value = 0;
    print("diem so: " + "$score");
    isShowResult(score: score);
    _timer.cancel();
  }

  void isShowResult({int score = 0}) {
    if (start.value == 0) {
      if (choose.indexOf(answer) == indexChoose.value) {
        isTrue.value = true;
        this.score.value = this.score.value + score;
        EnterNameController controller = Get.find();
        roomQuery.doc(roomId).update({
          "user_join": FieldValue.arrayRemove([
            {"name": controller.name.value, "score": getNowScore()}
          ])
        });
        roomQuery.doc(roomId).update({
          "user_join": FieldValue.arrayUnion([
            {"name": controller.name.value, "score": this.score.value}
          ])
        });
        result++;
      } else
        isTrue.value = false;
    }
  }

  int getNowScore() {
    EnterNameController controller = Get.find();
    UserJoin user = room.value.userJoin
        .singleWhere((element) => element.name == controller.name.value);
    return user.score;
  }

  void stop() {
    Get.to(ResultPage(result.value));
  }
}
