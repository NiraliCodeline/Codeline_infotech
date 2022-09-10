import 'dart:convert';

import 'package:codeline_infotech/api_handler/handlers.dart';
import 'package:codeline_infotech/constant/api_routes.dart';

import '../models/req/update_student_details_req_model.dart';
import '../screens/splash_screen.dart';

class UpdateStudentDetailsRepo {
  static Future<bool> updateStudentDetailsrepo(
      UpdateStudentDetailsReqModel updateStudentDetailsReqModel) async {
    //Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};
    Map<String, String> header = {"Authorization": '${bearerToken}'};

    var response = await API.apiHandlers(
        Url: '${ApiRoutes.updateStudentDetails}',
        apiTypes: ApiTypes.Post,
        reqBody: updateStudentDetailsReqModel.toJson(),
        header: header);

    print("UpdateStudentDetailsRESPONSE------------${response}");
    print(
        "UpdateStudentDetailsURL--------------${ApiRoutes.updateStudentDetails}");

    if (response != null) {
      var responseData = jsonDecode(response);
      if (responseData['update_details'] == "successfully") return true;
      return false;
    } else {
      return false;
    }

    //return getStudentsDetailsResModelFromJson(response!);
  }
}
