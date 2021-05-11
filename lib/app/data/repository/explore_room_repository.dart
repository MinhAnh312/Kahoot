import 'package:flutter/cupertino.dart';
import 'package:khoot/app/data/provider/explore_room_provider.dart';


class ExploreRoomRepository {
  final ExploreRoomProvider provider;

  ExploreRoomRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}