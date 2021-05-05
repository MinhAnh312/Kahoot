import 'package:khoot/app/data/repository/finalresult_respository.dart';
import 'package:get/get.dart';

class FinalResultController extends GetxController{

  final FinalResultRepository repository;

  FinalResultController({this.repository});
  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}