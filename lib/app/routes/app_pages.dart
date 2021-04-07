
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
  ];
}
