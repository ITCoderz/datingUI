import 'dart:convert';
import 'dart:io';
import 'package:dating/models/api_models/get_all_favrt.dart';
import 'package:dating/models/api_models/login_model.dart';
import 'package:dating/models/api_models/user_profile_model.dart';
import 'package:dating/screens/auth/controllers/auth_controllers.dart';
import 'package:dating/utils/local_storage/get_storage_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart'; // Used for file name extraction
import 'package:dating/api_providers/app_urls.dart';
import 'package:dating/utils/snackbar/snack_bar.dart';

import '../models/api_models/get_all_user_list_model.dart';

class AuthProvider {
  AuthProvider._();

  static final AuthProvider _instance = AuthProvider._();

  factory AuthProvider() {
    return _instance;
  }

  GetAllUserListModel? userProfileData = null;

  Future<bool> updateProfileUser(
      {required String fullName,
      required String email,
      required String contact,
      required String gender,
      required String height,
      required String relationshipStatus,
      required String city,
      required String dob,
      required String password,
      required String passwordConfirmation,
      required List<dynamic> imagePaths, // Ensure this is List<File>
      required List<int> deletedImages,
      required String currentPassword}) async {
    try {
      // Prepare the multipart request
      var url = Uri.parse(AppUrl.updateProfile);
      var request = http.MultipartRequest('POST', url);

      print('Deleted Images: ${deletedImages.toString()}');

      // Retrieve and validate the token
      var token = Get.find<StorageController>()
              .getLoginModel()
              ?.data
              ?.token
              ?.toString() ??
          '';
      print('Token: $token'); // Debug token

      // Set up the request headers directly on the request object
      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        // Set this if needed; otherwise, it can be omitted
      });

      request.fields.addAll({
        'full_name': fullName,
        'email': email,
        'contact': contact,
        'gender': gender,
        'height': height,
        'relation_ship': relationshipStatus,
        'city': city,
        'dob': dob,
        'about': 'about',
        'password': password,
        'password_confirmation': passwordConfirmation,
        'current_password': currentPassword,
        if (deletedImages.isNotEmpty)
          'delete_image_id':
              deletedImages.join(','), // Join as a string if needed
      });

      // Add image files to the request
      for (File imagesPath in imagePaths) {
        String path =
            imagesPath.path; // Get the string path from the File object
        request.files.add(await http.MultipartFile.fromPath(
          'images[]',
          path,
        ));
      }

      // Send the request
      var response = await request.send();

      print('Request: ${response.request}');
      print('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        deletedImages.clear();
        deletedImages = [];
        var responseBody = await http.Response.fromStream(response);
        var responseData = jsonDecode(responseBody.body);
        print('Response Data: ${json.encode(responseData)}');
        return true;
      } else {
        print("Error: ${response.reasonPhrase}");
        SnackBarAlerts.warningAlert(
            message: response.reasonPhrase ?? "Unknown error");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      SnackBarAlerts.warningAlert(message: "Error occurred: $e");
      return false;
    }
  }

  Future<void> sendProfilePreference({
    required String gender,
    required String height,
    required String relationShip,
    required String age,
    required String lat,
    required String lng,
    required String language,
    required String isSports,
    required String isAlcohol,
    required String wantChild,
    required String hasChild,
    required String isSmoker,
  }) async {
    var token = Get.find<StorageController>()
            .getLoginModel()
            ?.data
            ?.token
            ?.toString() ??
        '';
    var headers = {
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'
    };

    // Retrieve and validate the token

    print('Token: $token'); // Debug token

    var body = json.encode({
      "gender": gender,
      "height": height,
      "relation_ship": relationShip,
      "age": age,
      "lat": lat,
      "lng": lng,
      "language": language,
      "is_sports": isSports,
      "is_alcohol": isAlcohol,
      "want_child": wantChild,
      "has_child": hasChild,
      "is_smoker": isSmoker
    });

    var request = http.Request('POST', Uri.parse(AppUrl.setPrefrences));
    request.headers.addAll(headers);
    request.body = body;

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print(responseBody);

        SnackBarAlerts.successAlert(message: "Set Preferences Updated");
      } else {
        print('Error: ${response.reasonPhrase}');
        SnackBarAlerts.warningAlert(message: response.reasonPhrase ?? "Error");
      }
    } catch (e) {
      print('An error occurred: $e');
      SnackBarAlerts.warningAlert(message: e.toString() ?? "Updated");
    }
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
    required String userImagePath,
    required List<dynamic> imagePaths, // List of image paths
  }) async {
    print('$userImagePath *userImage'); // Debugging output
    try {
      // Prepare the multipart request
      var url = Uri.parse(AppUrl.register);
      var request = http.MultipartRequest('POST', url);
      // Add fields to the request
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
        'age': age,
      });

      // Add image files to the request
      for (String path in imagePaths) {
        request.files.add(await http.MultipartFile.fromPath(
          'images[]',
          path,
        ));
      }

      // Add the user's main profile image
      request.files.add(await http.MultipartFile.fromPath(
        'user_image',
        userImagePath,
      ));

      // Debugging output for fields and files
      print('Fields: ${request.fields}');
      print('Files: ${request.files.length}');

      // Send the request
      var response = await request.send();
      print('Request: ${response.request}');
      print('Status Code: ${response.statusCode}');

      // Handle the response
      if (response.statusCode == 200) {
        var responseBody = await http.Response.fromStream(response);
        var responseData = jsonDecode(responseBody.body);
        print('Response Data: ${json.encode(responseData)}');
        return true;
      } else {
        print('Error: ${response.reasonPhrase}');
        SnackBarAlerts.warningAlert(
            message: response.reasonPhrase ?? "Unknown error");
        return false;
      }
    } catch (e) {
      print('Error: $e');
      SnackBarAlerts.warningAlert(message: "Error occurred: $e");
      return false;
    }
  }

  Future<void> deleteFavorites(String userId) async{

    var token = Get.find<StorageController>()
        .getLoginModel()
        ?.data
        ?.token
        ?.toString() ??
        '';
    var headers = {
      'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'
    };

    var request = http.Request('POST', Uri.parse(AppUrl.deleteFavourite+userId));
    print(AppUrl.deleteFavourite+userId);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      SnackBarAlerts.successAlert(message: "User Sucessfully Deleted");
      print(await response.stream.bytesToString());

    } else {
      SnackBarAlerts.warningAlert(message: response.reasonPhrase.toString());
    print(response.reasonPhrase);
    }

  }

  Future<void> addToFavorites(String userId) async {
    // Log the user ID for debugging
    print('User ID: $userId');


    // Retrieve token from StorageController
    var token = 'Bearer ' + Get.find<StorageController>().getLoginModel()!.data!.token.toString();
    var headers = {
      'Authorization': token,
      'Content-Type': 'application/json' // Ensure content type is set
    };

    // Create the request
    var request = http.Request('POST', Uri.parse(AppUrl.storeFavourite));

    // Check if userId is valid
    if (userId.isEmpty) {

      return; // Exit if userId is empty
    }

    // Set the request body
    request.body = json.encode({"user_id": userId}); // Ensure user_id is correctly passed

    // Log the request body for debugging
    print('Request Body: ${request.body}');

    // Add headers to the request
    request.headers.addAll(headers);

    try {
      // Send the request and await response
      http.StreamedResponse response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Response Body: $responseBody'); // Log successful response
        SnackBarAlerts.successAlert(message: 'Favourite Has Been Added Succesfully!'); // Show success alert
      } else {
        // Handle errors
        SnackBarAlerts.warningAlert(message: response.reasonPhrase.toString());
        print('Error: ${response.statusCode} - ${response.reasonPhrase}'); // Log the error
      }
    } catch (e) {
      SnackBarAlerts.warningAlert(message: e.toString());
      print('Request failed: $e'); // Log exceptions
    }
  }



  Future<FavouriteModel?> fetchFavouriteData() async {
    var token = 'Bearer ' +
        Get.find<StorageController>().getLoginModel()!.data!.token.toString();
    var headers = {'Authorization': token};
    var request = http.Request(
      'GET',
      Uri.parse(AppUrl.favourite),
    );
    print(AppUrl.favourite);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      return FavouriteModel.fromJson(jsonDecode(responseString));
    } else {
      print('Error: ${response.reasonPhrase}');
      return null;
    }

  }

  Future<List<UserProfileDataObj>> getAllUsersList() async {
    var token = 'Bearer ' +
        Get.find<StorageController>().getLoginModel()!.data!.token.toString();
    var headers = {'Authorization': token};
    try {
      final response =
          await http.get(Uri.parse(AppUrl.getUserList), headers: headers);
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        print(responseBody);
        userProfileData = GetAllUserListModel.fromJson(responseBody);
        return userProfileData!.data;
      } else {
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
    return [];
  }

  Future<List<UserProfileDataObj>> getFilterUsers({
    required int selectedGenderIndex,
    required String selectedLang,
    required bool isSmoked,
    required bool isSports,
    required bool isAlcohol,
    required bool wantChild,
    required bool hasChild,
    required String selectedRelationship,
    required String age,
    required distance,
  }) async {
    Uri uri = Uri.parse(AppUrl.getUserList).replace(
      queryParameters: {
        'interested_in': selectedGenderIndex.toString(),
        'language': selectedLang,
        'is_sports': isSports ? '1' : '0',
        'is_alcohol': isAlcohol ? '1' : '0',
        'want_child': wantChild ? '1' : '0',
        'has_child': hasChild ? '1' : '0',
        'is_smoker': isSmoked ? '1' : '0',
        'relation_ship': selectedRelationship.toString(),
        'age': age,
        'distance': distance
      },
    );
    print(uri);
    var token = 'Bearer ' +
        Get.find<StorageController>().getLoginModel()!.data!.token.toString();
    var headers = {'Authorization': token};
    // Fetch data from the API
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      GetAllUserListModel users =
          GetAllUserListModel.fromJson(json.decode(response.body));
      print(users.data);
      return users.data; // Update userProfiles
    } else {
      print('Error fetching users: ${response.reasonPhrase}');
      return [];
    }
  }

  Future<void> fetchUserProfile() async {
    var token = 'Bearer ' +
        Get.find<StorageController>().getLoginModel()!.data!.token.toString();
    var headers = {'Authorization': token};
    try {
      final response =
          await http.get(Uri.parse(AppUrl.getProfile), headers: headers);

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        UserProfileData userProfileData =
            UserProfileData.fromJson(responseBody);
        Get.find<StorageController>().storUserProfileModel(userProfileData);
        print(userProfileData);
      } else {
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("An error occurred: $e");
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
        Get.find<StorageController>()
            .storeLoginModel(LoginModel.fromJson(responseData));

        return true;
      } else {
        print("Error: ${response.reasonPhrase}");
        SnackBarAlerts.warningAlert(
            message: response.reasonPhrase ?? "Unknown error");
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
        var decodedResponse = json.decode(responseBody);

        // Check if there's an error message
        if (decodedResponse.containsKey('error')) {
          String errorMessage = decodedResponse['error'];
          print('Error: $errorMessage');
          SnackBarAlerts.warningAlert(message: errorMessage);
        } else {
          // Handle the success case (if no error is present in the response)
          print('OTP sent successfully');
          SnackBarAlerts.successAlert(message: "OTP sent successfully");
        }
      } else {
        print('Error: ${response.reasonPhrase}');
        SnackBarAlerts.warningAlert(
            message: response.reasonPhrase ?? "Unknown error");
      }
    } catch (e) {
      print("Error: $e");
      SnackBarAlerts.warningAlert(message: "Error occurred: $e");
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
        SnackBarAlerts.warningAlert(
            message: response.reasonPhrase ?? "Failed to reset password");
        return false;
      }
    } catch (e) {
      SnackBarAlerts.warningAlert(message: "Error occurred: $e");
      return false;
    }
  }
}
