import 'package:codeline_infotech/api_handler/handlers.dart';
import 'package:codeline_infotech/constant/api_routes.dart';

import '../models/res/get_all_demo_res_model.dart';
import '../screens/splash_screen.dart';

class GetAllDemoRepo {
  static Future<GetAllDemoResModel?> getAllDemorepo() async {
    //Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};
    Map<String, String> header = {"Authorization": '${bearerToken}'};

    var response = await API.apiHandlers(
        Url: ApiRoutes.getAllDemo, apiTypes: ApiTypes.Get, header: header);

    print("GetAllDemoRESPONSE------------${response}");
    print("GetAllDemoURL--------------${ApiRoutes.getAllDemo}");

    return getAllDemoResModelFromJson(response!);
  }
}
