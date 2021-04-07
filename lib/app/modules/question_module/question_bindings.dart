import 'package:khoot/app/modules/question_module/question_controller.dart';
import 'package:khoot/app/data/provider/question_provider.dart';
import 'package:khoot/app/data/repository/question_repository.dart';
import 'package:get/get.dart';


class QuestionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionController(repository: QuestionRepository(provider: QuestionProvider())));
  }
}