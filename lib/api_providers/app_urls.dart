class AppUrl {
  static const String baseUrl = 'https://dating.coderzsolution.com/api';

  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String otpSend = '$baseUrl/otp/send';
  static const String verifyOtp = '$baseUrl/otp/verify';
  static const String passwordReset = '$baseUrl/password/reset';
  static const String getProfile = '$baseUrl/profile';
  static const String updateProfile = '$baseUrl/profile/update';

//https://dating.coderzsolution.com/api/profile/preference
  static const String setPrefrences = '$baseUrl/profile/preference';

  ///https://dating.coderzsolution.com/api/users
  static const String getUserList = '$baseUrl/users';
  static const String favourite='$baseUrl/favourite';
  static const String deleteFavourite='$baseUrl/favourite/delete/';
  static const String storeFavourite='$baseUrl/favourite/store';





}
