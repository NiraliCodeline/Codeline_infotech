import 'package:codeline_infotech/api_handler/handlers.dart';
import 'package:codeline_infotech/constant/api_routes.dart';

import '../models/res/get_allInquiry_res_model.dart';

class GetAllInquiryRepo {
  static Future<GetAllInquiryResModel?> getAllInquiryrepo() async {
    Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};

    var response = await API.apiHandlers(
        Url: ApiRoutes.getAllInquiry, apiTypes: ApiTypes.Get, header: header);

    print("GetAllInquiryRESPONSE------------${response}");
    print("GetAllInquiryURL--------------${ApiRoutes.getDashboardDetails}");

    return getAllInquiryResModelFromJson(response!);
  }
}
