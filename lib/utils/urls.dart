class Urls {
  static String baseUrls = 'https://task-manager-api.ostad.live/api/v1';
  static String Registration = "$baseUrls/Registration";
  static String Login = '$baseUrls/Login';
  static String getTaskCount = '$baseUrls/taskStatusCount';
  static String createTask = '$baseUrls/createTask';
  static String taskByStatus(String status) =>
      '$baseUrls/listTaskByStatus/$status';
  static String taskDelete(String id) => '$baseUrls/deleteTask/$id';
  static String updateTaskStatus(String id, String status) =>
      "$baseUrls/updateTaskStatus/$id/$status";

  static String updateProfile = "$baseUrls/ProfileUpdate";
  static String recoveryEmailVerify(String email) =>
      "$baseUrls/RecoverVerifyEmail/$email";

  static String recoveryOtpVery(String email, String otp) =>
      "$baseUrls/RecoverVerifyOtp/$email/$otp";

  static String recoveryPassword = "$baseUrls/RecoverResetPassword";
}
