import 'dart:async';

import 'package:khoot/app/data/repository/question_repository.dart';
import 'package:get/get.dart';
import 'package:khoot/app/modules/home_module/home_page.dart';
import 'package:khoot/app/modules/login_module/login_page.dart';

class QuestionController extends GetxController {
  final QuestionRepository repository;

  QuestionController({this.repository});

  Timer _timer;
  RxInt start = 10.obs;

  RxList<String> choose = ["1", "2", "3", "4"].obs;
  RxString answer = "2".obs;
  RxInt indexChoose = 99.obs;
  RxBool isTrue = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
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
