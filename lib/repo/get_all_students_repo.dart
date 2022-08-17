import 'package:codeline_infotech/api_handler/handlers.dart';
import 'package:codeline_infotech/constant/api_routes.dart';

import '../models/res/get_all_student_res_model.dart';

class GetAllStudentsRepo {
  static Future<GetAllStudentsResModel?> getAllStudents() async {
    Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};

    var response = await API.apiHandlers(
        Url: ApiRoutes.allStudents, apiTypes: ApiTypes.Get, header: header);

    print("GetAllStudentsRESPONSE------------${response}");
    print("GetAllStudentsURL--------------${ApiRoutes.allStudents}");

    return getAllStudentsResModelFromJson(response!);
  }
}
