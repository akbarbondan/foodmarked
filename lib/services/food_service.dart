part of 'services.dart';

class FoodServices {
  static Future<ApiresultValue<List<Food>>> getFood() async {
    await Future.delayed(Duration(milliseconds: 500));
    return ApiresultValue(value: mockFood);
  }
}
