import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khoot/app/const/const.dart';
import 'package:khoot/app/data/model/question.dart';
import 'package:khoot/app/data/repository/question_repository.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  final QuestionRepository repository;

  QuestionController({this.repository});

  Timer _timer;
  RxInt start = 10.obs;

  Query query =
      FirebaseFirestore.instance.collection(Const.QUESTION_COLLECTION);

  RxList<Question> listQuestion = <Question>[].obs;
  Rx<Question> question = Question().obs;

  RxList<String> choose = <String>[].obs;
  RxInt numberOfQuestion = 0.obs;

  RxString answer = "2".obs;
  RxInt indexChoose = 99.obs;
  RxBool isTrue = false.obs;

  Future<void> getListQuestion() async {
    QuerySnapshot querySnapshot = await query.get();
    for (int i = 0; i < querySnapshot.docChanges.length; i++) {
      listQuestion
          .add(Question.fromJson(querySnapshot.docChanges[i].doc.data()));
    }

  }

  void getQuestion(){
    print(listQuestion.length);
    numberOfQuestion.value = Random().nextInt(listQuestion.length);
    question.value = listQuestion[numberOfQuestion.value];
    choose.clear();
    choose.add(question.value.answer);
    choose.add(question.value.wrongAnswer1);
    choose.add(question.value.wrongAnswer2);
    choose.add(question.value.wrongAnswer3);
    answer.value = question.value.answer;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await getListQuestion();
    getQuestion();
    shuffle(choose);

    startTimer();
    super.onInit();
  }

  List shuffle(List items) {
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {

      // Pick a pseudorandom number according to the list length
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
    _timer.cancel();
    super.onClose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
    isShowResult();
  }

  void chooseAnswer(int index) {
    indexChoose.value = index;
    start.value = 0;
    isShowResult();
    print(isTrue.value);
    Timer.periodic(new Duration(milliseconds: 2000), (timer) {
      //Get.to(HomePage());
    });
  }

  void isShowResult() {
    if (start.value == 0) {
      if (choose.elementAt(indexChoose.value) == answer.value) {
        isTrue.value = true;
      } else
        isTrue.value = false;
    }
  }
}
