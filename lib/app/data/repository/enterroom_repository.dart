import 'package:khoot/app/data/provider/enterroom_provider.dart';
import 'package:flutter/cupertino.dart';


class EnterRoomRepository {
  final EnterRoomProvider provider;

  EnterRoomRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}