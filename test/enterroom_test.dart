import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khoot/app/modules/enterroom_module/enterroom_controller.dart';

void main() {
  var obj = EnterRoomController();
  group('Enter Room Test', () {
    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterroom('111111'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterroom('222222'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterroom('333333'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterroom('444444'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterroom('555555'));
    });

    test('Truy cập phòng thành công', () {
      expect('Sucess', obj.enterroom('666666'));
    });

    test('Phòng không tồn tại', () {
      expect('Failed', obj.enterroom('117412'));
    });

    test('Phòng không tồn tại', () {
      expect('Failed', obj.enterroom('781132'));
    });

    test('Thiếu ký tự', () {
      expect('Lack of characters', obj.enterroom('1132'));
    });

    test('Thiếu ký tự', () {
      expect('Lack of characters', obj.enterroom('11'));
    });
  });
}