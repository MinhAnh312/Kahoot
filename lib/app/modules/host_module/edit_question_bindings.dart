
import 'package:get/get.dart';
import 'package:khoot/app/data/provider/edit_question_provider.dart';
import 'package:khoot/app/data/repository/edit_question_repository.dart';

import 'edit_question_controller.dart';

class EditQuestionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditQuestionController(repository: EditQuestionRepository(provider: EditQuestionProvider())));

  }
}