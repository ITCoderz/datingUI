import 'dart:convert';

import 'package:dating/api_providers/auth_provider.dart';
import 'package:dating/models/api_models/get_all_user_list_model.dart';
import 'package:dating/screens/home/profile/controllers/edit_profile_controllers.dart';
import 'package:dating/screens/home/profile/views/edit_profile_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // Define the selectedImageIndexMap with specific types
  RxMap<int, int> selectedImageIndexMap = <int, int>{}.obs;
  RxList<UserProfileDataObj> userProfiles = <UserProfileDataObj>[].obs;
  RxList<UserProfileDataObj> dataFromSearched = <UserProfileDataObj>[].obs;
  RxBool isSearchClicked = false.obs; // Track if search is clicked
  RxBool isLoading = false.obs;

  void updateSelectedImageIndex(int postIndex, int newIndex) {
    selectedImageIndexMap[postIndex] = newIndex;
    update();
  }

  void updateSearchFlag() {
    isSearchClicked.value = !isSearchClicked.value;
    update();
  }

  void initializeProfiles(List<UserProfileDataObj> profiles) {
    profiles.forEach((profile) {
      // Ensure profile.id is cast to int correctly
      if (profile.id is int) {
        Get.find<HomeController>().selectedImageIndexMap[profile.id] = 0;
        update();
        // Initialize each post with index 0
      } else {
        print('Profile ID is not an integer for profile: $profile');
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllUsersList();
  }

  Future<List<UserProfileDataObj>> getAllUsersList() async {
    userProfiles.value = await AuthProvider().getAllUsersList();
    update();
    return userProfiles;
  }

  Future<void> runSearchAPI() async {
    isLoading.value = true;
    isSearchClicked.value = true;
    update();
    try {
      Language selectedLanguage =
          Get.find<ProfileController>().getSelectedLanguage();
      var selectedLang = "english";
      if (selectedLanguage == Language.english) {
        selectedLang = "english";
      } else if (selectedLanguage == Language.french) {
        selectedLang = "french";
      } else if (selectedLanguage == Language.spanish) {
        selectedLang = "spanish";
      }
      int selectedGenderIndex = Get.find<ProfileController>()
                  .getSelectedGender() ==
              Gender.male
          ? 1
          : Get.find<ProfileController>().getSelectedGender() == Gender.female
              ? 2
              : 0; // Default to 0 for 'both' or other

      Relationship selectedRelationship =
          Get.find<ProfileController>().getSelectedRelationship();
      var selectedRela = "single";
      if (selectedRelationship == Relationship.single) {
        selectedRela = "single";
      } else if (selectedRelationship == Relationship.married) {
        selectedRela = "married";
      }
      update();
      dataFromSearched.value = await AuthProvider().getFilterUsers(
        distance: Get.find<ProfileController>().selectedMilesRange.toString(),
          selectedGenderIndex: selectedGenderIndex,
          selectedLang: selectedLang,
          isSmoked: Get.find<ProfileController>().getSelectedSmoker() ==
                  Questionnaire.yes
              ? true
              : false,
          isSports: Get.find<ProfileController>().getSelectedSports() ==
                  Questionnaire.yes
              ? true
              : false,
          isAlcohol: Get.find<ProfileController>().getSelectedAlcohol() ==
                  Questionnaire.yes
              ? true
              : false,
          wantChild: Get.find<ProfileController>().getSelectedWantChildren() ==
                  Questionnaire.yes
              ? true
              : false,
          hasChild: Get.find<ProfileController>().getSelectedHasChildren() ==
                  Questionnaire.yes
              ? true
              : false,
          selectedRelationship: selectedRela,
          age: Get.find<ProfileController>().filterLowerValue.toString());
      isLoading.value = false;
      update();
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
