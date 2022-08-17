import 'package:codeline_infotech/api_handler/handlers.dart';
import 'package:codeline_infotech/constant/api_routes.dart';

import '../models/res/get_students_details_res_model.dart';

class GetStudentsDetailsRepo {
  static Future<GetStudentsDetailsResModel?> getStudentsDetails(int id) async {
    Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};

    var response = await API.apiHandlers(
        Url: '${ApiRoutes.allStudentsDetails}$id',
        apiTypes: ApiTypes.Get,
        header: header);

    print("STUDENT-ID-----------${ApiRoutes.allStudentsDetails}$id");
    print("GET STUDENT DETAILS RESPONSE------------${response}");
    print("URL--------------${ApiRoutes.allStudentsDetails}");

    return getStudentsDetailsResModelFromJson(response!);
  }
}
