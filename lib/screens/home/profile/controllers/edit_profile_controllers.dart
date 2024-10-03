import 'dart:io';

import 'package:dating/models/api_models/user_profile_model.dart';
import 'package:dating/screens/home/home_screen/view/home_screen.dart';
import 'package:dating/utils/local_storage/get_storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../api_providers/auth_provider.dart';
import '../../../../utils/snackbar/snack_bar.dart';
import '../../../auth/views/congratulations_screen.dart';

import 'package:http/http.dart' as http;

import '../views/uplaod_photos_screen.dart';

enum Gender { male, female, both }

enum Language { french, english, spanish }

enum Relationship { serious, fun, friends }

enum Questionnaire { yes, no }

class ProfileController extends GetxController {

  var favourite = true.obs;
  User? user;
  var filterLowerValue = 18.0;
  var filterUpperValue = 70.0;
  List<int> deletedImages = [];

  String selectedUserLanguage = '';
  var selectedMilesRange = 1000.0;
  var selectedMilesRangeDefault = 2490000.0;

  selectedMilesRangeFunction(value) {
    selectedMilesRange = value;
    selectedMilesRangeDefault = value;
    update();
  }

  var selectedGender = Gender.male.obs;

  User? profileUser;

  setSelectedRelation(String value) {
    selectedRelation = value;
    update();
  }

  setUserLanguage(String value) {
    selectedUserLanguage = value;
    update();
  }

  setSelectedRelationSetPref(String value) {
    selectedRelationSetPref = value;
    update();
  }

  void setSelectedGender(Gender gender) {
    selectedGender.value = gender;
  }

  Gender getSelectedGender() {
    return selectedGender.value;
  }

  var selectedLanguage = Language.french.obs;

  void setSelectedLanguage(Language language) {
    selectedLanguage.value = language;
  }

  Language getSelectedLanguage() {
    return selectedLanguage.value;
  }

  var selectedRelationship = Relationship.serious.obs;

  void setSelectedRelationship(Relationship relationship) {
    selectedRelationship.value = relationship;
  }

  Relationship getSelectedRelationship() {
    return selectedRelationship.value;
  }

  var selectedSports = Questionnaire.yes.obs;

  void setSelectedSports(Questionnaire sports) {
    selectedSports.value = sports;
  }

  Questionnaire getSelectedSports() {
    return selectedSports.value;
  }

  var selectedAlcohol = Questionnaire.yes.obs;

  void setSelectedAlcohol(Questionnaire alcohol) {
    selectedAlcohol.value = alcohol;
  }

  Questionnaire getSelectedAlcohol() {
    return selectedAlcohol.value;
  }

  var selectedWantChildren = Questionnaire.yes.obs;

  void setSelectedWantChildren(Questionnaire children) {
    selectedWantChildren.value = children;
  }

  Questionnaire getSelectedWantChildren() {
    return selectedWantChildren.value;
  }

  var selectedHasChildren = Questionnaire.yes.obs;

  void setSelectedHasChildren(Questionnaire children) {
    selectedHasChildren.value = children;
  }

  Questionnaire getSelectedHasChildren() {
    return selectedHasChildren.value;
  }

  var selectedSmoker = Questionnaire.yes.obs;

  void setSelectedSmoker(Questionnaire smoker) {
    selectedSmoker.value = smoker;
  }

  Questionnaire getSelectedSmoker() {
    return selectedSmoker.value;
  }



  void uploadData() {
    print(selectedSports.value);
    Get.find<ProfileController>().userMap['gender'] =
        selectedGender.value.name.toString();
    Get.find<ProfileController>().userMap['relation_ship'] =
        selectedRelationship.value.name.toString();
    Get.find<ProfileController>().userMap['is_sports'] =
        selectedSports.value == Questionnaire.yes ? 1 : 0;
    Get.find<ProfileController>().userMap['is_alcohol'] =
        selectedAlcohol.value == Questionnaire.yes ? 1 : 0;
    Get.find<ProfileController>().userMap['want_child'] =
        selectedWantChildren.value == Questionnaire.yes ? 1 : 0;
    Get.find<ProfileController>().userMap['has_child'] =
        selectedHasChildren.value == Questionnaire.yes ? 1 : 0;
    Get.find<ProfileController>().userMap['is_smoker'] =
        selectedSmoker.value == Questionnaire.yes ? 1 : 0;
  }

  Map<String, dynamic> userMap = {};
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController mmController = TextEditingController();
  TextEditingController ddController = TextEditingController();
  TextEditingController yyyyController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  var selectedGenderProfile = 'Male';
  var selectedRelation = "Uncle";
  var selectedRelationSetPref = '';

  List<Media> mediaList = [];

  RxBool loading = false.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  final hidePassword2 = true.obs;
  final hidePassword3 = true.obs;

  togglePasswordVisibility() {
    hidePassword.value = !hidePassword.value;
  }

  togglePasswordVisibility2() {
    hidePassword2.value = !hidePassword2.value;
  }

  togglePasswordVisibility3() {
    hidePassword3.value = !hidePassword3.value;
  }

  RxList images = [].obs;

  var selectedImage0 = Rx<XFile?>(null);
  var selectedImage1 = Rx<XFile?>(null);
  var selectedImage2 = Rx<XFile?>(null);
  var selectedImage3 = Rx<XFile?>(null);
  var selectedImage4 = Rx<XFile?>(null);
  var selectedImage5 = Rx<XFile?>(null);
  var selectedImage6 = Rx<XFile?>(null);
  var selectedImage7 = Rx<XFile?>(null);

  var isDeleted0=false.obs;
  var isDeleted1=false.obs;
  var isDeleted2=false.obs;
  var isDeleted3=false.obs;
  var isDeleted4=false.obs;
  var isDeleted5=false.obs;
  var isDeleted6=false.obs;
  var isDeleted7=false.obs;

  void setDeleted(bool isDeleted, int index,int deletedId) {
    deletedImages.add(deletedId);
    update();
    switch (index) {
      case 0:
        isDeleted0.value = isDeleted;
        update();
        break;
      case 1:
        isDeleted1.value = isDeleted;
        update();
        break;
      case 2:
        isDeleted2.value = isDeleted;
        update();
        break;
      case 3:
        isDeleted3.value = isDeleted;
        update();
        break;
      case 4:
        isDeleted4.value = isDeleted;
        update();
        break;
      case 5:
        isDeleted5.value = isDeleted;
        update();
        break;
      case 6:
        isDeleted6.value = isDeleted;
        update();
        break;
      case 7:
        isDeleted7.value = isDeleted;
        update();
        break;
      default:
        print('Index out of range');
    }
    update;
  }


  void setImagesAsIndex(int index, XFile selectedImage) {
    // Check the index and assign the selected image to the corresponding variable
    if (index == 0) {
      selectedImage0.value = selectedImage;
    } else if (index == 1) {
      selectedImage1.value = selectedImage;
    } else if (index == 2) {
      selectedImage2.value = selectedImage;
    } else if (index == 3) {
      selectedImage3.value = selectedImage;
    } else if (index == 4) {
      selectedImage4.value = selectedImage;
    } else if (index == 5) {
      selectedImage5.value = selectedImage;
    } else if (index == 6) {
      selectedImage6.value = selectedImage;
    } else if (index == 7) {
      selectedImage7.value = selectedImage;
    }
  }

  void setImagesAsNull(
    int index,
  ) {
    // Check the index and assign the selected image to the corresponding variable
    if (index == 0) {
      selectedImage0.value = null;
    } else if (index == 1) {
      selectedImage1.value = null;
    } else if (index == 2) {
      selectedImage2.value = null;
    } else if (index == 3) {
      selectedImage3.value = null;
    } else if (index == 4) {
      selectedImage4.value = null;
    } else if (index == 5) {
      selectedImage5.value = null;
    } else if (index == 6) {
      selectedImage6.value = null;
    } else if (index == 7) {
      selectedImage7.value = null;
    }
    update();
  }

  selectImage(int index) async {
    XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      setImagesAsIndex(index, selectedImage);
      update();
    } else {
      debugPrint("No image selected!");
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Enter your email";
    } else if (!regex.hasMatch(value)) {
      return "Invalid email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8 ||
        !value.contains(RegExp(r'[A-Z]')) ||
        !value.contains(RegExp(r'[0-9]')) ||
        !value.contains(RegExp(r'[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]'))) {
      return 'Password must be 8 characters long and include\nat least one uppercase letter, one number, \nand one symbol.';
    }
    return null;
  }

  Future<void> fetchAndUpdateProfile() async {
    try {
      loading.value = true;
      await AuthProvider().fetchUserProfile().then((_) {
        var userProfile = Get.find<StorageController>().getUserProfileModel();
        if (userProfile!.userObj.isNotEmpty) {
          user = userProfile.userObj[0];
          profileUser = user;
          mapData(user!);
          updateFieldsInput(user!);

          print(user!.media.length.toString() + "*mediaLength");

          if (user!.media != null) {
            mediaList = user!.media;
            update();
          }
        }
        update();
        loading.value = false;
        print("User profile fetched successfully.");
      }).catchError((error) {
        loading.value = false;
        // Handle any errors that occurred during fetchUserProfile
        print("Error fetching user profile: $error");
      });
    } catch (e) {
      loading.value = false;
      print(e.toString() + " **error");
    }
    print(loading.value);
  }

  @override
  void onInit() {
    fetchAndUpdateProfile();
    super.onInit();
  }

  void updateFieldsInput(User user) {
    fullNameController.text = user.name.toString();
    emailController.text = user.email.toString();
    contactController.text = user.contact.toString();
    heightController.text = user.height.toString();
    cityController.text = user.city.toString();
    ddController.text = user.dob.day.toString();
    mmController.text = user.dob.month.toString();
    yyyyController.text = user.dob.year.toString();
    selectedGenderProfile = user.gender.toString();
    print(user.gender.toString());
    selectedRelation = user.relationShip.toString();
    print(setSelectedRelation.toString() + "*setSelectedRelation");
    print(user.relationShip);
    if (selectedRelation.toString() == "null" || selectedRelation.isEmpty) {
      selectedRelation = 'Uncle';
    }
    if (selectedGenderProfile.toString() == "null" ||
        selectedGenderProfile.isEmpty) {
      selectedGenderProfile = 'Male';
    }


    print(user.media.length.toString() + "*Length");

    selectedRelationSetPref = user.gender;
    selectedUserLanguage = user.language;

    if (user.isSports) {
      setSelectedSports(
        Questionnaire.yes,
      );
    } else {
      setSelectedSports(
        Questionnaire.no,
      );
    }

    if (user.isAlcohol) {
      setSelectedAlcohol(
        Questionnaire.yes,
      );
    } else {
      setSelectedAlcohol(
        Questionnaire.no,
      );
    }

    if (user.isSmoker) {
      setSelectedSmoker(
        Questionnaire.yes,
      );
    } else {
      setSelectedSmoker(
        Questionnaire.no,
      );
    }
    if (user.hasChild) {
      setSelectedHasChildren(
        Questionnaire.yes,
      );
    } else {
      setSelectedHasChildren(
        Questionnaire.no,
      );
    }

    if (user.wantChild) {
      setSelectedWantChildren(
        Questionnaire.yes,
      );
    } else {
      setSelectedWantChildren(
        Questionnaire.no,
      );
    }
    profileUser!.name = fullNameController.text;
    profileUser!.email = emailController.text;
    profileUser!.contact = contactController.text;
    profileUser!.height = heightController.text;
    profileUser!.city = cityController.text;
    profileUser!.gender = selectedGenderProfile;
    print(user.gender.toString());
    profileUser!.relationShip = selectedRelation;
    update();
  }

  void mapData(User user) {
    userMap = {
      "fullName": user.name.toString(),
      "email": user.email.toString(),
      "contact": user.contact.toString(),
      "height": user.height.toString(),
      "city": user.city.toString(),
      "dayOfBirth": user.dob.day.toString(),
      "monthOfBirth": user.dob.month.toString(),
      "yearOfBirth": user.dob.year.toString(),
      "gender": user.gender.toString(),
      "relationShip": user.relationShip.toString(),
    };

// Setting default values if they are null or empty
    userMap["relationShip"] =
        (userMap["relationShip"] == "null" || userMap["relationShip"].isEmpty)
            ? "Uncle"
            : userMap["relationShip"];

    userMap["gender"] =
        (userMap["gender"] == "null" || userMap["gender"].isEmpty)
            ? "Male"
            : userMap["gender"];
  }

  void validatePasswords() {
    String currentPassword = currentPasswordController.text;
    String newPassword = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (currentPassword.isEmpty) {
      SnackBarAlerts.warningAlert(message: "Current password cannot be empty.");
    } else if (newPassword.isEmpty) {
      SnackBarAlerts.warningAlert(message: "New password cannot be empty.");
    } else if (confirmPassword.isEmpty) {
      SnackBarAlerts.warningAlert(message: "Confirm password cannot be empty.");
    } else if (newPassword != confirmPassword) {
      SnackBarAlerts.warningAlert(
          message: "New password and confirm password do not match.");
    } else if (!isPasswordValid(newPassword)) {
      SnackBarAlerts.warningAlert(
          message: "New password is not strong enough.");
    } else {
      SnackBarAlerts.warningAlert(
          message: "Passwords are valid. Proceed with update.");
    }
  }

  void updateSelectedImages() {
    update();
    // Check each selected image and add it to the list if it's not null
    if (selectedImage0.value != null) {
      images.add(File(selectedImage0.value!.path));
      if (user!.media.length > 0) {
        deletedImages.add(user!.media[0].id);
      }
    }
    if (selectedImage1.value != null) {
      images.add(File(selectedImage1.value!.path));
      if (user!.media.length > 1) {
        deletedImages.add(user!.media[1].id);
      }
    }

    if (selectedImage2.value != null) {
      images.add(File(selectedImage2.value!.path));
      if (user!.media.length > 2) {
        deletedImages.add(user!.media[2].id);
      }
    }

    if (selectedImage3.value != null) {
      images.add(File(selectedImage3.value!.path));
      if (user!.media.length > 3) {
        deletedImages.add(user!.media[3].id);
      }
    }

    if (selectedImage4.value != null) {
      images.add(File(selectedImage4.value!.path));
      if (user!.media.length > 4) {
        deletedImages.add(user!.media[4].id);
      }
    }

    if (selectedImage5.value != null) {
      images.add(File(selectedImage5.value!.path));
      if (user!.media.length > 5) {
        deletedImages.add(user!.media[5].id);
      }
    }

    if (selectedImage6.value != null) {
      images.add(File(selectedImage6.value!.path));
      if (user!.media.length > 6) {
        deletedImages.add(user!.media[6].id);
      }
    }

    if (selectedImage7.value != null) {
      images.add(File(selectedImage7.value!.path));
      if (user!.media.length > 7) {
        deletedImages.add(user!.media[7].id);
      }
    }
    update();
    print(deletedImages.length);
  }

  Future<void> updateUserProfile() async {
    // Combine date parts into one string
    String dob =
        "${yyyyController.text}-${mmController.text}-${ddController.text}";

    // Start loading
    loading.value = true;
    try {
      updateSelectedImages();
      print(deletedImages.length.toString());

      bool? result = await AuthProvider().updateProfileUser(
        fullName: fullNameController.text,
        email: emailController.text,
        contact: contactController.text,
        gender: selectedGender.value.name,
        // This can be dynamic based on your form
        height: heightController.text,
        relationshipStatus: selectedRelation,
        // This can be dynamic based on your form
        city: cityController.text,
        dob: dob,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        imagePaths: images,
        deletedImages: deletedImages,
        currentPassword: currentPasswordController.text
        
      );

      // Stop loading
      loading.value = false;

      if (result) {
        SnackBarAlerts.successAlert(message: "Update successful!");
        deletedImages.clear();
        deletedImages=[];
        // Clear text controllers
        fullNameController.clear();
        emailController.clear();
        contactController.clear();
        heightController.clear();
        cityController.clear();
        mmController.clear();
        ddController.clear();
        yyyyController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        // Clear images and selections
        images.clear();
        deletedImages.clear();
        update();
          Get.to(() =>  HomeScreen());
      } else {
        SnackBarAlerts.warningAlert(
            message: "Update failed. Please try again.");
      }
    } catch (e) {
      loading.value = false;
      SnackBarAlerts.warningAlert(message: "An error occurred: $e");
    }
  }

// A helper function to check password strength (you can adjust the rules)
  bool isPasswordValid(String password) {
    return password.length >=
        8; // Example: password must be at least 8 characters long
  }
  //
  // Future<void> updateProfile() async {
  //   loading.value = true;
  //   var headers = {
  //     'Authorization': 'Bearer ' +
  //         Get.find<StorageController>().getLoginModel()!.data!.token.toString()
  //   };
  //
  //   print(headers);
  //   updateSelectedImages();
  //   print(deletedImages.length.toString());
  //   var request = http.MultipartRequest('POST',
  //       Uri.parse('https://dating.coderzsolution.com/api/profile/update'));
  //
  //   request.fields.addAll({
  //     'full_name': fullNameController.text,
  //     'gender': selectedGenderProfile,
  //     'height': '100',
  //     'relation_ship': selectedRelation,
  //     'city': cityController.text,
  //     'dob': yyyyController.text +
  //         "-" +
  //         mmController.text +
  //         "-" +
  //         ddController.text,
  //     'email': emailController.text,
  //     'contact': contactController.text,
  //     'about': "aboutController.text",
  //     'current_password': currentPasswordController.text,
  //     'password': passwordController.text,
  //     'password_confirmation': confirmPasswordController.text,
  //     'age': '25',
  //     'address': "dsd",
  //
  //   });
  //
  //   print(request.fields);
  //
  //   if (images.isNotEmpty) {
  //     try {
  //       request.files
  //           .add(await http.MultipartFile.fromPath('images[]', images[0]));
  //     } catch (e) {
  //       print('Error picking image: $e');
  //     }
  //   }
  //
  //   request.headers.addAll(headers);
  //
  //   print(request.fields);
  //
  //   try {
  //     http.StreamedResponse response = await request.send();
  //     if (response.statusCode == 200) {
  //       String responseString = await response.stream.bytesToString();
  //       print('Profile updated successfully: $responseString');
  //       loading.value = false;
  //       SnackBarAlerts.successAlert(message: "Update successful!");
  //     } else {
  //       loading.value = false;
  //       print('Failed to update profile: ${response.reasonPhrase}');
  //       SnackBarAlerts.warningAlert(
  //           message: "Update failed. Please try again.");
  //     }
  //   } catch (e) {
  //     loading.value = false;
  //     print('Request error: $e');
  //     SnackBarAlerts.warningAlert(
  //         message: "Update failed. Please try again. $e");
  //   }
  //   loading.value = false;
  // }

  void checkFields() {
    if (fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        contactController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        ddController.text.isNotEmpty &&
        mmController.text.isNotEmpty &&
        yyyyController.text.isNotEmpty &&
        selectedGenderProfile.isNotEmpty &&
        selectedRelation.isNotEmpty) {
      if (isValidDate(int.parse(ddController.text.toString()), int.parse(mmController.text), int.parse(yyyyController.text))) {
        Get.to(EditUploadYourPhotosScreen());
        print(yyyyController.text);
      } else {
        SnackBarAlerts.warningAlert(message: "Please select valid date.");
      }
    } else {
      // At least one field is empty; print a message
      SnackBarAlerts.warningAlert(message: "Please fill in all fields.");
      print("Please fill in all fields.");
    }
  }

  bool isValidDate(int day, int month, int year) {
    // Get the current date
    DateTime today = DateTime.now();

    // Check if the year is valid (4 digits between 1000 and 9999) and not greater than the current year
    if (year < 1000 || year > today.year) {
      return false;
    }

    // Check if month is valid (between 1 and 12)
    if (month < 1 || month > 12) {
      return false;
    }

    // Check if day is valid (positive and within the correct range for the month)
    if (day < 1) {
      return false;
    }

    // Number of days in each month
    List<int> daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    // Adjust for leap year in February
    if (month == 2 && isLeapYear(year)) {
      daysInMonth[1] = 29; // Set February to 29 days in a leap year
    }

    // Ensure day does not exceed the maximum allowed days for the month
    if (day > daysInMonth[month - 1]) {
      return false;
    }

    // Check if the date is greater than today
    DateTime inputDate = DateTime(year, month, day);
    if (inputDate.isAfter(today)) {
      return false;
    }

    // If all checks pass, the date is valid
    return true;
  }

// Helper function to check for leap year
  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }
}
