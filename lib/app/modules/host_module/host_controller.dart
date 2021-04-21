import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khoot/app/const/const.dart';
import 'package:khoot/app/data/repository/host_repository.dart';
import 'package:get/get.dart';

class HostController extends GetxController {
  final HostRepository repository;

  HostController({this.repository});

  Query query = FirebaseFirestore.instance.collection(Const.COLLECTION);


}
