import 'dart:io';

import 'package:dating/models/api_models/user_profile_model.dart';
import 'package:dating/utils/local_storage/get_storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../api_providers/auth_provider.dart';
import '../../../../utils/snackbar/snack_bar.dart';
import '../../../auth/views/set_preference_screen.dart';


enum Gender { male, female, both }

enum Language { french, english, spanish }

enum Relationship { serious, fun, friends }
enum Questionnaire { yes, no }
class ProfileController extends GetxController {



  var lowerValue = 18.0.obs;
  var upperValue = 60.0.obs;
  var filterLowerValue = 18.0;
  var filterUpperValue = 70.0;
  var heightLowerValue = 18.0;
  var heightUpperValue = 70.0;
  var filterLowerValueMiles = 300.0;
  var filterUpperValueMiles = 700.0;
  var selectedMilesRange = 1000.0;
  var selectedMilesRangeDefault = 2490000.0;
  var favourite = true.obs;

  selectedMilesRangeFunction(value) {
    selectedMilesRange = value;
    selectedMilesRangeDefault = value;
    update();
  }

  var selectedGender = Gender.male.obs;

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

  Map<String, dynamic> userMap={};
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
  List<Media> mediaList=[];

  RxBool loading = false.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  final hidePassword2 = true.obs;
  final hidePassword3=true.obs;

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
          User user = userProfile.userObj[0];
          mapData(user);
          updateFieldsInput(user);

          if(user.media!=null){
            mediaList=  user.media;
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

  void updateFieldsInput(User user){
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
    if (selectedRelation.toString() == "null" ||
        selectedRelation.isEmpty) {
      selectedRelation = 'Uncle';
    }
    if (selectedGenderProfile.toString() == "null" || selectedGenderProfile.isEmpty) {
      selectedGenderProfile = 'Male';
    }
    update();
  }
  void mapData(User user){

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
    userMap["relationShip"] = (userMap["relationShip"] == "null" || userMap["relationShip"].isEmpty)
        ? "Uncle"
        : userMap["relationShip"];

    userMap["gender"] = (userMap["gender"] == "null" || userMap["gender"].isEmpty)
        ? "Male"
        : userMap["gender"];

  }
  updateUserProfile(){

    // userMap["password"]=passwordController.text.toString();
    // userMap['password_confirmation']=confirmPasswordController.text.toString();


  }

  void validatePasswords() {
    String currentPassword = currentPasswordController.text;
    String newPassword = passwordController.text;
    String confirmPassword =confirmPasswordController.text;

    if (currentPassword.isEmpty) {
      SnackBarAlerts.warningAlert(
          message: "Current password cannot be empty."
      );
    } else if (newPassword.isEmpty) {
      SnackBarAlerts.warningAlert(
          message: "New password cannot be empty."
      );
    } else if (confirmPassword.isEmpty) {
      SnackBarAlerts.warningAlert(
          message: "Confirm password cannot be empty."
      );
    } else if (newPassword != confirmPassword) {
      SnackBarAlerts.warningAlert(
          message: "New password and confirm password do not match."
      );
    }  else if (!isPasswordValid(newPassword)) {
      SnackBarAlerts.warningAlert(
          message: "New password is not strong enough."
      );
    } else {
      Get.to(()=> const SetPreferenceScreen());
      SnackBarAlerts.warningAlert(
          message: "Passwords are valid. Proceed with update."
      );
    }
  }



// A helper function to check password strength (you can adjust the rules)
  bool isPasswordValid(String password) {
    return password.length >= 8; // Example: password must be at least 8 characters long
  }

}

