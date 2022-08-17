import 'package:codeline_infotech/models/res/get_all_student_res_model.dart';
import 'package:codeline_infotech/repo/get_all_students_repo.dart';
import 'package:get/get.dart';

class GetAllStudentsController extends GetxController {
  var isLoading = false.obs;
  GetAllStudentsResModel? allStudentList;
  List<Datum> searchResult = [];
  RxBool isSearch = false.obs;
  //RxList<Datum> allData = <Datum>[].obs;

  List<Datum>? allData;

  @override
  void onInit() {
    fetchAllStudent();
    super.onInit();
    update();
  }

  void fetchAllStudent() async {
    try {
      isLoading(true);
      var allStudents = await GetAllStudentsRepo.getAllStudentsRepo();
      if (allStudents != null) {
        allStudentList = allStudents;
        print("------------->>>>>>>>>>>>>$allStudentList");

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

  void addSearchResult(Datum value) {
    searchResult.add(value);
    update();
  }
}
