import 'package:codeline_infotech/repo/get_dashboard_details_repo.dart';
import 'package:get/get.dart';

import '../models/res/get_dashboard_details_res_model.dart';

class GetDashboardDetailsController extends GetxController {
  var isLoading = false.obs;
  GetDashboardDetailsResModel? allDashboardDetailsList;

  @override
  void onInit() {
    fetchAllDashboardDetails();
    super.onInit();
    update();
  }

  void fetchAllDashboardDetails() async {
    await Future.delayed(Duration(seconds: 3));
    try {
      isLoading(true);
      var allStudents = await GetDashboardDetailsRepo.getDashboardDetailsrepo();
      if (allStudents != null) {
        allDashboardDetailsList = allStudents;

        print(
            "CompletedStudent:--------${allDashboardDetailsList!.completedStudent}");
        update();
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}
