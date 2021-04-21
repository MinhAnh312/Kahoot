import 'package:flutter/cupertino.dart';
import 'package:khoot/app/data/provider/edit_question_provider.dart';


class EditQuestionRepository {
  final EditQuestionProvider provider;

  EditQuestionRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}