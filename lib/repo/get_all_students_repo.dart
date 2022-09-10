import 'package:codeline_infotech/api_handler/handlers.dart';
import 'package:codeline_infotech/constant/api_routes.dart';

import '../models/res/get_all_student_res_model.dart';
import '../screens/splash_screen.dart';

class GetAllStudentsRepo {
  static Future<GetAllStudentsResModel?> getAllStudentsRepo() async {
    //Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};
    Map<String, String> header = {"Authorization": '${bearerToken}'};

    var response = await API.apiHandlers(
        Url: ApiRoutes.allStudents, apiTypes: ApiTypes.Get, header: header);

    print("GetAllStudentsRESPONSE------------${response}");
    print("GetAllStudentsURL--------------${ApiRoutes.allStudents}");

    return getAllStudentsResModelFromJson(response!);
  }
}
