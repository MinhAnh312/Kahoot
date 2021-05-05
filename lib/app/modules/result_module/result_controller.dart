import 'package:khoot/app/data/repository/result_repository.dart';
import 'package:get/get.dart';

class ResultController extends GetxController{

final ResultRepository repository;

ResultController({this.repository});
  var _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}