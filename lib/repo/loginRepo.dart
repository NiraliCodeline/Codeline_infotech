import 'dart:convert';

import '../api_handler/handlers.dart';
import '../constant/api_routes.dart';

class LoginRepo {
  static Future<Map<String, dynamic>> login(
      {required String username, required String password}) async {
    var response = await API.apiHandlers(
      Url: ApiRoutes.BaseUrl + "Login",
      apiTypes: ApiTypes.Post,
      reqBody: {"username": username, "password": password},
    );

    if (response != null) {
      Map<String, dynamic> resData = jsonDecode(response);

      if (resData['token'] != null || resData['token'] != "") {
        print("Login response token-----------${resData['token']}");

        return {
          "result": true,
          "token": resData['token'],
          "role": resData['role']
        };
      } else {
        return {"result": false, "token": null};
      }
    } else {
      return {"result": false, "token": null};
    }
  }
}
