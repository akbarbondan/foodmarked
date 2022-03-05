part of 'services.dart';

class UserServices {
  static Future<ApiresultValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(Duration(milliseconds: 3));
    return ApiresultValue(value: mockUser);
  }
}
