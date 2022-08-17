import 'dart:convert';

import '../api_handler/handlers.dart';
import '../constant/api_routes.dart';

class TwoPhaseAuthenticationRepo {
  static Future<Map<String, dynamic>> twoPhaseAuthMethod(
      {required String code}) async {
    var response = await API.apiHandlers(
      Url: "${ApiRoutes.verifyCode}",
      apiTypes: ApiTypes.Post,
      reqBody: {"secret_code": code},
    );

    print("TwoPhaseAuthentication response-------------$response");

    if (response != null) {
      Map<String, dynamic> resData = jsonDecode(response);

      if (resData['verify_code'] != null) {
        print("verify_code=>${resData['verify_code']}");
        return {"result": true, "verify_code": resData['verify_code']};
      } else {
        return {"result": false, "verify_code": null};
      }
    } else {
      return {"result": false, "verify_code": null};
    }
  }
}
