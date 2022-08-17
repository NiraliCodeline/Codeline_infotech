import 'package:codeline_infotech/api_handler/handlers.dart';
import 'package:codeline_infotech/constant/api_routes.dart';

import '../models/res/get_dashboard_details_res_model.dart';

class GetDashboardDetailsRepo {
  static Future<GetDashboardDetailsResModel?> getDashboardDetailsrepo() async {
    Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};

    var response = await API.apiHandlers(
        Url: ApiRoutes.getDashboardDetails,
        apiTypes: ApiTypes.Get,
        header: header);

    print("GetDashboardDetailsRESPONSE------------${response}");
    print(
        "GetDashboardDetailsURL--------------${ApiRoutes.getDashboardDetails}");

    return getDashboardDetailsResModelFromJson(response!);
  }
}
