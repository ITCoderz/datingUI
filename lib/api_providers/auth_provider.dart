import 'dart:convert';
import 'dart:io';
import 'package:dating/models/api_models/login_model.dart';
import 'package:dating/utils/local_storage/get_storage_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart'; // Used for file name extraction
import 'package:dating/api_providers/app_urls.dart';
import 'package:dating/utils/snackbar/snack_bar.dart';

class AuthProvider {
  AuthProvider._();

  static final AuthProvider _instance = AuthProvider._();

  factory AuthProvider() {
    return _instance;
  }

  Future<bool> registerUser({
    required String fullName,
    required String email,
    required String contact,
    required String gender,
    required String height,
    required String relationshipStatus,
    required String city,
    required String dob,
    required String password,
    required String passwordConfirmation,
    required String age,
    required List<dynamic> imagePaths, // List of image paths
  }) async {
    try {
      // Prepare the multipart request
      var url = Uri.parse(AppUrl.register);
      var request = http.MultipartRequest('POST', url);
      print("<--------------data--------------");
      print(fullName);
      print(email);
      print(contact);
      print(gender);
      print(height);
      print(relationshipStatus);
      print(city);
      print(dob);
      print(password);
      print(passwordConfirmation);
      print(age);
      print(imagePaths);
      print("<--------------data--------------");

      request.fields.addAll({
        'full_name': fullName,
        'email': email,
        'contact': contact,
        'gender': gender,
        'height': height,
        'relation_ship': relationshipStatus,
        'city': city,
        'dob': dob,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'age': age
      });

      // Add image files to the request
      for (String path in imagePaths) {
        request.files.add(await http.MultipartFile.fromPath(
          'images[]',
          path,
        ));
      }

      // Send the request
      var response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseBody = await http.Response.fromStream(response);
        var responseData = jsonDecode(responseBody.body);
        print(json.encode(responseData));
        return true;
      } else {
        print("Error: ${response.reasonPhrase}");
        SnackBarAlerts.warningAlert(message: response.reasonPhrase ?? "Unknown error");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      SnackBarAlerts.warningAlert(message: "Error occurred: $e");
      return false;
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Prepare the request
      var url = Uri.parse(AppUrl.login);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = json.encode({
        'email': email,
        'password': password,
      });

      var request = http.Request('POST', url)
        ..headers.addAll(headers)
        ..body = body;

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var responseData = jsonDecode(responseBody);
        print(json.encode(responseData));
        Get.find<StorageController>().storeLoginModel(LoginModel.fromJson(responseData));

        return true;
      } else {
        print("Error: ${response.reasonPhrase}");
        SnackBarAlerts.warningAlert(message: response.reasonPhrase ?? "Unknown error");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      SnackBarAlerts.warningAlert(message: "Error occurred: $e");
      return false;
    }
  }
  Future<void> sendOtp(String email) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(AppUrl.otpSend);
      var request = http.Request('POST', url);
      request.body = json.encode({
        "email": email,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print(responseBody);
      } else {
        print(response.reasonPhrase);
        SnackBarAlerts.warningAlert(message: response.reasonPhrase ?? "Unknown error");
      }
    } catch (e) {
      print("Error: $e");
      SnackBarAlerts.warningAlert(message: "Error occurred: $e");
    }
  }
  Future<bool> verifyOtp(String otp) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(AppUrl.verifyOtp);
      var request = http.Request('POST', url)
        ..headers.addAll(headers)
        ..body = json.encode({"otp": otp});

      var response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        print(response.reasonPhrase);
        SnackBarAlerts.warningAlert(message: response.reasonPhrase ?? "Failed to verify OTP");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      SnackBarAlerts.warningAlert(message: "Error occurred: $e");
      return false;
    }
  }
  Future<bool> resetPassword({
    required String otp,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(AppUrl.passwordReset);
      var request = http.Request('POST', url)
        ..headers.addAll(headers)
        ..body = json.encode({
          "otp": otp,
          "password": password,
          "password_confirmation": passwordConfirmation,
        });

      var response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        SnackBarAlerts.warningAlert(message: response.reasonPhrase ?? "Failed to reset password");
        return false;
      }
    } catch (e) {
      SnackBarAlerts.warningAlert(message: "Error occurred: $e");
      return false;
    }
  }
}
