import 'package:flutter_test/flutter_test.dart';
import 'package:khoot/app/modules/enterroom_module/enterroom_controller.dart';

void main() {
  var obj = EnterRoomController();
  group('Enter Room Test', () {
    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterRoom('111111'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterRoom('222222'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterRoom('333333'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterRoom('444444'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterRoom('555555'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterRoom('666666'));
    });

    test('Phòng không tồn tại', () {
      expect('Failed', obj.enterRoom('117412'));
    });

    test('Phòng không tồn tại', () {
      expect('Failed', obj.enterRoom('781132'));
    });

    test('Thiếu ký tự', () {
      expect('Lack of characters', obj.enterRoom('1132'));
    });

    test('Thiếu ký tự', () {
      expect('Lack of characters', obj.enterRoom('11'));
    });
  });
}