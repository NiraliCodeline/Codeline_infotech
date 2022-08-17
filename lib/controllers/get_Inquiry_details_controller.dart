import 'package:get/get.dart';

import '../models/res/get_Inquiry_details_res_model.dart';
import '../repo/get_Inquiry_details_repo.dart';

class GetInquiryDetailsController extends GetxController {
  final id;
  var isLoading = false.obs;
  GetInquiryDetailsResModel? allInquiryDetailsList;

  GetInquiryDetailsController(this.id);

  @override
  void onInit() {
    fetchAllInquiryStudent();
    super.onInit();
    update();
  }

  void fetchAllInquiryStudent() async {
    try {
      isLoading(true);
      var allStudents = await GetInquiryDetailsRepo.getInquiryDetailsrepo(id);
      if (allStudents != null) {
        allInquiryDetailsList = allStudents as GetInquiryDetailsResModel?;

        print("InquiryStudent:--------${allInquiryDetailsList}");
        update();
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
