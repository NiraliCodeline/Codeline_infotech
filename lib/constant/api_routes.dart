class ApiRoutes {
  static var dataToken =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiI0IiwidXNlcm5hbWUiOiJtYWxhbmluaWtzQGdtYWlsLmNvbSIsInVzZXJUeXBlIjoiYWRtaW4ifQ.R6dHZTsnrH2x3hgWDFJUlo0cGF6IiBvUFAaVflj2ljo";

  static String BaseUrl = 'https://codelineinfotech.com/test/api/';
  static String Login = 'Login';
  static String allStudents = '${BaseUrl}GetAllStudent';
  static String allStudentsDetails = '${BaseUrl}GetStudentDetails/';
  static String addNewStudent = '${BaseUrl}AddNewStudent';
  static String addInstallment = '${BaseUrl}AddInstallment';
  static String updateCurrentCourse = '${BaseUrl}UpdateCurrentCourse';
  static String updateBatch = '${BaseUrl}UpdateBatch';
  static String updateIsFavourite = '${BaseUrl}UpdateIsFavourite';
  static String uploadAvatar = '${BaseUrl}UploadAvatar';
  static String verifyCode = '${BaseUrl}VerifyCode';
  static String deleteAvatar = '${BaseUrl}DeleteAvatar';
  static String getAllFevStudent = '${BaseUrl}GetAllFevStudent';
  static String getDashboardDetails = '${BaseUrl}GetDashboardDetails';
  static String getAllInquiry = '${BaseUrl}GetAllInquiry';
  static String getInquiryDetails = '${BaseUrl}GetInquiryDetails/';
  static String addNewInquiry = '${BaseUrl}AddNewInquiry';
  static String getAllDemo = '${BaseUrl}GetAllDemo';
  static String startDemo = '${BaseUrl}StartDemo';
  static String updateIsCompleted = '${BaseUrl}UpdateIsCompleted';
}
