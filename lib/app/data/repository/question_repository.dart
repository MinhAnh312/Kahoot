import 'package:khoot/app/data/provider/question_provider.dart';
import 'package:flutter/cupertino.dart';


class QuestionRepository {
  final QuestionProvider provider;

  QuestionRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}