import 'dart:io';

import 'package:dating/models/api_models/user_profile_model.dart';
import 'package:dating/utils/local_storage/get_storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../api_providers/auth_provider.dart';
import '../../../../utils/snackbar/snack_bar.dart';
import '../../../auth/views/set_preference_screen.dart';
import 'package:http/http.dart' as http;

import '../views/uplaod_photos_screen.dart';

enum Gender { male, female, both }

enum Language { french, english, spanish }

enum Relationship { serious, fun, friends }

enum Questionnaire { yes, no }

class ProfileController extends GetxController {
  var lowerValue = 18.0.obs;
  var upperValue = 60.0.obs;
  var filterLowerValue = 18.0;
  var filterUpperValue = 70.0;
  var heightLowerValue = 100.0;
  var heightUpperValue = 350.0;
  var filterLowerValueMiles = 300.0;
  var filterUpperValueMiles = 700.0;
  var selectedMilesRange = 1000.0;
  var selectedMilesRangeDefault = 2490000.0;
  var favourite = true.obs;
  User? user;

  String selectedUserLanguage = '';

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

  clearAll() {
    lowerValue.value = 18.0;
    upperValue.value = 70.0;

    filterLowerValue = 18.0;
    filterUpperValue = 70.0;
    filterLowerValueMiles = 300.0;
    filterUpperValueMiles = 700.0;
    selectedMilesRange = 500.0;
    selectedMilesRangeDefault = 2490000.0;
    update();
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

  selectImage() async {
    XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      File convertedFile = File(selectedImage.path);
      images.add(convertedFile.path);
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

    print(user.age.toString());

    if (user.age.toString() == 'null') {
      filterLowerValue = 19;
    } else {
      filterLowerValue = double.parse(user.age);
    }

    print(user.height.toString() + "***");

    if (user.height.toString() == 'null') {
      heightLowerValue = 100;
    } else if (double.parse(user.height.toString()) < 100) {
      heightLowerValue = 101;
    } else if (double.parse(user.height.toString()) > heightUpperValue) {
      heightLowerValue = 100;
    } else {
      print(user.height.toString() + "I am Height");
      heightLowerValue = double.parse(user.height);
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

    // var heightLowerValue = 18.0;
    // var heightUpperValue = 70.0;
    //
    // var filterLowerValueMiles = 300.0;
    // var filterUpperValueMiles = 700.0;
    //
    // var selectedMilesRange = 1000.0;
    // var selectedMilesRangeDefault = 2490000.0;
    // var favourite = true.obs;

    profileUser!.name = fullNameController.text;

    profileUser!.email = emailController.text;

    profileUser!.contact = contactController.text;

    profileUser!.height = heightController.text;

    profileUser!.city = cityController.text;

    //  profileUser!.dob=   ddController.text
    //
    //   mmController.text =
    //   yyyyController.text = user.dob.year.toString();

    profileUser!.gender = selectedGenderProfile;
    print(user.gender.toString());
    profileUser!.relationShip = selectedRelation;

    print(setSelectedRelation.toString() + "*setSelectedRelation");

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

  Future<void> updateUserProfile() async {
    // Combine date parts into one string
    String dob =
        "${yyyyController.text}-${mmController.text}-${ddController.text}";

    // Start loading
    loading.value = true;

    try {
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
        age: filterLowerValue.toString(),
        imagePaths: images,
      );

      // Stop loading
      loading.value = false;

      if (result) {
        SnackBarAlerts.successAlert(message: "Update successful!");

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

        update();
        //  Get.to(() => const CongratulationsScreen());
      } else {
        SnackBarAlerts.warningAlert(
            message: "Registration failed. Please try again.");
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

  Future<void> updateProfile() async {
    loading.value = true;
    var headers = {
      'Authorization': 'Bearer ' +
          Get.find<StorageController>().getLoginModel()!.data!.token.toString()
    };

    print(headers);
    var request = http.MultipartRequest('POST',
        Uri.parse('https://dating.coderzsolution.com/api/profile/update'));

    request.fields.addAll({
      'full_name': fullNameController.text,
      'gender': selectedGenderProfile,
      'height': '100',
      'relation_ship': selectedRelation,
      'city': cityController.text,
      'dob': yyyyController.text +
          "-" +
          mmController.text +
          "-" +
          ddController.text,
      'email': emailController.text,
      'contact': contactController.text,
      'about': "aboutController.text",
      'current_password': currentPasswordController.text,
      'password': passwordController.text,
      'password_confirmation': confirmPasswordController.text,
      'age': '25',
      'address': "dsd"
    });

    // 'full_name': 'testing',
    // 'gender': 'male',
    // 'height': '2.0',
    // 'relation_ship': 'single',
    // 'city': 'karachi',
    // 'dob': '2024-12-12',
    // 'email': 'abc1@gmail.com',
    // 'contact': '03034488400',
    // 'about': 'sdadsadasdasdasdas',
    // 'current_password': '12345678',
    // 'password': '12345678',
    // 'password_confirmation': '12345678',
    // 'age': '22',
    // 'address': 'kakak'
    print(request.fields);

    if (images.isNotEmpty) {
      try {
        request.files
            .add(await http.MultipartFile.fromPath('images[]', images[0]));
      } catch (e) {
        print('Error picking image: $e');
      }
    }

    request.headers.addAll(headers);

    print(request.fields);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String responseString = await response.stream.bytesToString();
        print('Profile updated successfully: $responseString');
        loading.value = false;
        SnackBarAlerts.successAlert(message: "Update successful!");
      } else {
        loading.value = false;
        print('Failed to update profile: ${response.reasonPhrase}');
        SnackBarAlerts.warningAlert(
            message: "Update failed. Please try again.");
      }
    } catch (e) {
      loading.value = false;
      print('Request error: $e');
      SnackBarAlerts.warningAlert(
          message: "Update failed. Please try again. $e");
    }
    loading.value = false;
  }

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
      Get.to(EditUploadYourPhotosScreen());
    } else {
      // At least one field is empty; print a message
      SnackBarAlerts.warningAlert(message: "Please fill in all fields.");
      print("Please fill in all fields.");
    }
  }
}
