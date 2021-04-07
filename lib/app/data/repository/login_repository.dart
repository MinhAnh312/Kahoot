import 'package:khoot/app/data/provider/login_provider.dart';
import 'package:flutter/cupertino.dart';


class LoginRepository {
  final LoginProvider provider;

  LoginRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}