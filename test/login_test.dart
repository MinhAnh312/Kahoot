import 'package:test/test.dart';
import 'package:khoot/app/modules/login_module/login_controller.dart';

void main() {
  final _login = LoginController();
  group('Test Login', () {
    test('Login success', () async {
      await _login.loginInEmail('ltthinhtb@gmail.com', '123456');
      expect(_login.msg, 'Thành công');
    });

    test('Login success', () async {
      await _login.loginInEmail('tthinhtb@gmail.com', '123456');
      expect(_login.msg, 'Thành công');
    });

    test('Login fail', () async {
      await _login.loginInEmail('ltth@gmail.com', '123456');
      expect(_login.msg, 'Tài khoản không tồn tại');
    });

    test('Login success', () async {
      await _login.loginInEmail('ltfdsfth@gmail.com', '123456');
      expect(_login.msg, 'Tài khoản không tồn tại');
    });

    test('Login fail', () async {
      await _login.loginInEmail('ltth@gmail.com', '123456');
      expect(_login.msg, 'Tài khoản không tồn tại');
    });

    test('Login success', () async {
      await _login.loginInEmail('ltfdsfth@gmail.com', '123456');
      expect(_login.msg, 'Tài khoản không tồn tại');
    });

    test('Login success', () async {
      await _login.loginInEmail('ltthinhtb@gmail.com', '1221213456');
      expect(_login.msg, 'Sai mật khẩu');
    });

    test('Login success', () async {
      await _login.loginInEmail('ltth@gmail.com', '123456');
      expect(_login.msg, 'Sai mật khẩu');
    });

    test('Login success', () async {
      await _login.loginInEmail('ltthinhtb@gmail.com', '1221213456');
      expect(_login.msg, 'Sai mật khẩu');
    });

    test('Login success', () async {
      await _login.loginInEmail('ltth@gmail.com', '123456');
      expect(_login.msg, 'Sai mật khẩu');
    });
  });
}