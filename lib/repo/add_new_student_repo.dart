import 'dart:convert';

import 'package:codeline_infotech/constant/api_routes.dart';
import 'package:codeline_infotech/models/req/add_new_student_req_model.dart';

import '../api_handler/handlers.dart';

class AddNewStudentRepo {
  static Future<bool> getAllStudents(
      AddNewStudentReqModel addNewStudentReqModel) async {
    Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};

    var response = await API.apiHandlers(
        Url: '${ApiRoutes.addNewStudent}',
        apiTypes: ApiTypes.Post,
        reqBody: addNewStudentReqModel.toJson(),
        header: header);

    print("AddNewStudentRESPONSE------------${response}");
    //("URL--------------${ApiRoutes.allStudentsDetails}");

    if (response != null) {
      var responseData = jsonDecode(response);
      if (responseData['register_student'] == "successfully") return true;
      return false;
    } else {
      return false;
    }
  }
}
