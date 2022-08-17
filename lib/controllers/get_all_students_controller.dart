import 'package:codeline_infotech/models/res/get_all_student_res_model.dart';
import 'package:codeline_infotech/repo/get_all_students_repo.dart';
import 'package:get/get.dart';

class GetAllStudentsController extends GetxController {
  var isLoading = false.obs;
  GetAllStudentsResModel? allStudentList;
  RxList<Datum> allData = <Datum>[].obs;

  @override
  void onInit() {
    fetchAllStudent();
    super.onInit();
    update();
  }

  void fetchAllStudent() async {
    try {
      isLoading(true);
      var allStudents = await GetAllStudentsRepo.getAllStudents();
      if (allStudents != null) {
        allStudentList = allStudents;

        print("Student_Count:${allStudentList!.data![0].fullName}");
        update();
      }
    } finally {
      isLoading(false);
      update();
    }
  }

  void updateIsFav(int index, bool isFav) {
    allStudentList!.data![index].favorite = isFav ? "1" : "0";
    update();
  }
}
