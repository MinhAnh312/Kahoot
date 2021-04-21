import 'package:get/get_connect/connect.dart';


const baseUrl = 'http://youapi';

class HostProvider extends GetConnect {

  Future<Response> getUser(int id) => get('$baseUrl/users/id');

  Future<Response> postUser(Map data) => post('$baseUrl/users', data);

}