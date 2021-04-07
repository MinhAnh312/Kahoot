import 'package:flutter/cupertino.dart';
import 'package:khoot/app/data/provider/entername_provider.dart';

class EnterNameRepository {
  final EnterNameProvider provider;

  EnterNameRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}