import 'package:khoot/app/data/provider/result_provider.dart';
import 'package:flutter/cupertino.dart';


class ResultRepository {
  final ResultProvider provider;

  ResultRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}