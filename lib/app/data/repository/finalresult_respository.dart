import 'package:khoot/app/data/provider/finalresult_provider.dart';
import 'package:flutter/cupertino.dart';


class FinalResultRepository {
  final FinalResultProvider provider;

  FinalResultRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}