import 'dart:convert';

import 'package:codeline_infotech/constant/api_routes.dart';

import '../api_handler/handlers.dart';
import '../models/req/add_new_Inquiry_req_model.dart';

class AddNewInquiryRepo {
  static Future<bool> addNewInquiryrepo(
      AddNewInquiryReqModel addNewInquiryReqModel) async {
    Map<String, String> header = {"Authorization": '${ApiRoutes.dataToken}'};

    var response = await API.apiHandlers(
        Url: '${ApiRoutes.addNewInquiry}',
        apiTypes: ApiTypes.Post,
        reqBody: addNewInquiryReqModel.toJson(),
        header: header);

    print("AddNewInquiryRESPONSE------------${response}");
    //("URL--------------${ApiRoutes.allStudentsDetails}");

    if (response != null) {
      var responseData = jsonDecode(response);
      if (responseData['Inquiry_register'] == "successfully") return true;
      return false;
    } else {
      return false;
    }
  }
}
