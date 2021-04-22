import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khoot/app/const/const.dart';
import 'package:get/get.dart';
import 'package:khoot/app/data/repository/edit_question_repository.dart';

class EditQuestionController extends GetxController {
  final EditQuestionRepository repository;

  EditQuestionController({this.repository});

  Query query = FirebaseFirestore.instance.collection(Const.QUESTION_COLLECTION);


}
