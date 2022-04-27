part of 'services.dart';

class FoodServices {
  static Future<ApiresultValue<List<Food>>> getFood(
      {https.Client client}) async {
    client ??= https.Client();
    String url = baseUrl + 'food';
    var respond = await client.get(url);

    if (respond.statusCode != 200) {
      return ApiresultValue(message: "Please try again");
    }

    var data = jsonDecode(respond.body);
    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();
    return ApiresultValue(value: foods);
  }
}
