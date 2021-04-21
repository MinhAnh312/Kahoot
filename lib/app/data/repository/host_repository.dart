import 'package:khoot/app/data/provider/host_provider.dart';
import 'package:flutter/cupertino.dart';


class HostRepository {
  final HostProvider provider;

  HostRepository({@required this.provider}) : assert(provider != null);

  getUser(id) {
    return provider.getUser(id);
  }

  postUser(Map data) {
    return provider.postUser(data);
  }

}