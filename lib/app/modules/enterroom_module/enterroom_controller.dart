import 'package:flutter_test/flutter_test.dart';
import 'package:khoot/app/modules/enterroom_module/enterroom_controller.dart';

void main() {
  // var obj = new EnterRoomController();
  var array = EnterRoomController.rooms;
  group('Enter Room Test', () {
    test('Truy cập phòng thành công', () {
      expect('Sucess', EnterRoomController.enterroom('111111', array));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', EnterRoomController.enterroom('222222', array));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', EnterRoomController.enterroom('333333', array));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', EnterRoomController.enterroom('444444', array));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', EnterRoomController.enterroom('555555', array));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', EnterRoomController.enterroom('666666', array));
    });

    test('Phòng không tồn tại', () {
      expect('Failed', EnterRoomController.enterroom('117412', array));
    });

    test('Phòng không tồn tại', () {
      expect('Failed', EnterRoomController.enterroom('781132', array));
    });

    test('Thiếu ký tự', () {
      expect('Lack of characters', EnterRoomController.enterroom('1132', array));
    });

    test('Thiếu ký tự', () {
      expect('Lack of characters', EnterRoomController.enterroom('11', array));
    });
  });
}
