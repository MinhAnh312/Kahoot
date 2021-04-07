import 'package:khoot/app/data/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';


class HomeRepository {
  final HomeProvider provider;

  HomeRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}