import 'package:codeline_infotech/api_handler/handlers.dart';
import 'package:codeline_infotech/constant/api_routes.dart';

import '../models/res/get_all_demo_res_model.dart';

class GetAllDemoRepo {
  static Future<GetAllDemoResModel?> getAllDemorepo() async {
    Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};

    var response = await API.apiHandlers(
        Url: ApiRoutes.getAllDemo, apiTypes: ApiTypes.Get, header: header);

    print("GetAllDemoRESPONSE------------${response}");
    print("GetAllDemoURL--------------${ApiRoutes.getAllDemo}");

    return getAllDemoResModelFromJson(response!);
  }
}
