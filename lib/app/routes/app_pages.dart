import 'package:khoot/app/modules/host_module/edit_question_bindings.dart';
import 'package:khoot/app/modules/host_module/edit_question_page.dart';
import '../../app/modules/question_module/question_page.dart';
import '../../app/modules/question_module/question_bindings.dart';
import '../../app/modules/entername_module/entername_page.dart';
import '../../app/modules/entername_module/entername_bindings.dart';
import '../../app/modules/enterroom_module/enterroom_page.dart';
import '../../app/modules/enterroom_module/enterroom_bindings.dart';
import '../../app/modules/home_module/home_page.dart';
import '../../app/modules/home_module/home_bindings.dart';
import '../../app/modules/login_module/login_bindings.dart';
import '../../app/modules/login_module/login_page.dart';
import '../../app/modules/result_module/result_binding.dart';
import '../../app/modules/result_module/result_page.dart';
import '../../app/modules/finalresult_module/finalresult_binding.dart';
import '../../app/modules/finalresult_module/finalresult_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ENTERROOM,
      page: () => EnterRoomPage(),
      binding: EnterRoomBinding(),
    ),
    GetPage(
      name: Routes.ENTERNAME,
      page: () => EnterNamePage(),
      binding: EnterNameBinding(),
    ),
    GetPage(
      name: Routes.QUESTION,
      page: () => QuestionPage(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: Routes.EDIT_QUESTION,
      page: () => EditQuestionPage(),
      binding: EditQuestionBinding(),
    ),
    GetPage(
      name: Routes.RESULT,
      page: () => ResultPage(0),
      binding: ResultBinding(),
    ),
    GetPage(
      name: Routes.FINAL_RESULT,
      page: () => FinalResultPage(),
      binding: FinalResultBinding(),
    ),
  ];
}
