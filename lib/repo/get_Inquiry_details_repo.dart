import 'package:codeline_infotech/api_handler/handlers.dart';
import 'package:codeline_infotech/constant/api_routes.dart';

import '../models/res/get_Inquiry_details_res_model.dart';
import '../screens/splash_screen.dart';

class GetInquiryDetailsRepo {
  static Future<GetInquiryDetailsResModel?> getInquiryDetailsrepo(
      int id) async {
    //Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};
    Map<String, String> header = {"Authorization": '${bearerToken}'};

    var response = await API.apiHandlers(
        Url: '${ApiRoutes.getInquiryDetails}$id',
        apiTypes: ApiTypes.Get,
        header: header);

    print(
        "GetInquiryDetails STUDENT-ID-----------${ApiRoutes.getInquiryDetails}$id");
    print("GetInquiryDetails RESPONSE------------${response}");
    print("GetInquiryDetails URL--------------${ApiRoutes.getInquiryDetails}");

    return getInquiryDetailsResModelFromJson(response!);
  }
}
