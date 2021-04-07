import 'package:get/get.dart';
import 'package:khoot/app/data/repository/entername_repository.dart';

class EnterNameController extends GetxController{

  final EnterNameRepository repository;

  EnterNameController({this.repository});

  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
