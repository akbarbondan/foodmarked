part of 'services.dart';

class UserServices {
  static Future<ApiresultValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(Duration(milliseconds: 3));
    return ApiresultValue(value: mockUser);
  }

  static Future<ApiresultValue<User>> signUp(User user, String password,
      {File picturePath, https.Client client}) async {
    if (client == null) {
      client = https.Client();
    }

    String url = baseUrl + 'register';
    var respondApi = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "name": user.name,
          "email": user.email,
          "password": password,
          "password_confirmation": password,
          "address": user.address,
          "city": user.city,
          "houseNumber": user.houseNumber,
          "phoneNumber": user.phoneNumber
        }));

    if (respondApi.statusCode != 200) {
      return ApiresultValue(message: "Please try again");
    }
    var data = jsonDecode(respondApi.body);
    User.token = data['data']['access_token'];
    User value = data['data']['user'];

    if (picturePath != null) {
      ApiresultValue<String> result = await uploadPicture(picturePath);
      if (result.value != null) {
        value = value.copyWith(
            picturePath:
                'http://foodmarket-backend.buildwithangga.id/api/storage/' +
                    result.value);
      }
    }

    return ApiresultValue(value: value);
  }

  static Future<ApiresultValue<String>> uploadPicture(File filePicture,
      {https.MultipartRequest request}) async {
    String url = baseUrl + "user/photo";
    var uri = Uri.parse(url);

    if (request == null) {
      request = https.MultipartRequest("POST", uri)
        ..headers['Content-type'] = "application/json"
        ..headers['Authorization'] = "Bearer ${User.token}";
    }

    var multipartFile =
        await https.MultipartFile.fromPath('file', filePicture.path);

    request.files.add(multipartFile);

    var responds = await request.send();
    if (responds.statusCode == 200) {
      String respondBody = await responds.stream.bytesToString();
      var data = jsonDecode(respondBody);
      String imagePath = data["data"][0];

      return ApiresultValue(value: imagePath);
    } else {
      return ApiresultValue(message: "Uploading Progile Picture Failed");
    }
  }
}
