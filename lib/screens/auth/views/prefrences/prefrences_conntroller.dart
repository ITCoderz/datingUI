import 'package:get/get.dart';

import '../../../../api_providers/auth_provider.dart';
import '../../../../models/api_models/user_profile_model.dart';
import '../../../../utils/local_storage/get_storage_controller.dart';
import '../../../home/profile/controllers/edit_profile_controllers.dart';

class PrefrencesConntroller extends GetxController {
  var loadingMain = false.obs;
  var loadingUpdate=false.obs;
  User? user;
  User? profileUser;
  var lowerValue = 18.0.obs;
  var upperValue = 60.0.obs;
  var lowerAgeValue = 18.0;
  var filterUpperValue = 70.0;
  var heightLowerValue = 100.0;
  var heightUpperValue = 350.0;
  var filterLowerValueMiles = 300.0;
  var filterUpperValueMiles = 700.0;
  var selectedMilesRange = 1000.0;
  var selectedMilesRangeDefault = 2490000.0;
  var selectedRelationSetPref = '';
  String selectedUserLanguage = '';
  var selectedSports = Questionnaire.yes.obs;
  var selectedAlcohol = Questionnaire.yes.obs;
  var selectedWantChildren = Questionnaire.yes.obs;
  var selectedHasChildren = Questionnaire.yes.obs;
  var selectedSmoker = Questionnaire.yes.obs;
  var selectedGender = ''.obs;

  void setSelectedSmoker(Questionnaire smoker) {
    selectedSmoker.value = smoker;
  }

  Questionnaire getSelectedSmoker() {
    return selectedSmoker.value;
  }

  Questionnaire getSelectedWantChildren() {
    return selectedWantChildren.value;
  }

  void setSelectedAlcohol(Questionnaire alcohol) {
    selectedAlcohol.value = alcohol;
  }

  Questionnaire getSelectedAlcohol() {
    return selectedAlcohol.value;
  }

  void setSelectedWantChildren(Questionnaire children) {
    selectedWantChildren.value = children;
  }

  void setSelectedHasChildren(Questionnaire children) {
    selectedHasChildren.value = children;
  }

  Questionnaire getSelectedHasChildren() {
    return selectedHasChildren.value;
  }

  Questionnaire getSelectedSports() {
    return selectedSports.value;
  }

  void setSelectedSports(Questionnaire sports) {
    selectedSports.value = sports;
  }

  setUserLanguage(String value) {
    selectedUserLanguage = capitalizeFirstLetter(value);
    update();
  }

  setSelectedRelationSetPref(String value) {
    selectedRelationSetPref = value;
    update();
  }

  selectedMilesRangeFunction(value) {
    selectedMilesRange = value;
    selectedMilesRangeDefault = value;
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    await fetchAndUpdateProfile();

  }

  Future<void> fetchAndUpdateProfile() async {

    try {
      loadingMain.value = true;
      await AuthProvider().fetchUserProfile().then((_) {
        var userProfile = Get.find<StorageController>().getUserProfileModel();
        if (userProfile!.userObj.isNotEmpty) {
          user = userProfile.userObj[0];
          profileUser = user;
          if (profileUser != null) {
            updateFields(profileUser!);
          }
        }

        update();
        loadingMain.value = false;
        print("User profile fetched successfully.");
      }).catchError((error) {
        loadingMain.value = false;
        // Handle any errors that occurred during fetchUserProfile
        print("Error fetching user profile: $error");
      });
    } catch (e) {
      loadingMain.value = false;
      print(e.toString() + " **error");
    }
    print(loadingMain.value);
  }

  void updateGender(String genderValue) {
    selectedGender.value = capitalizeFirstLetter(genderValue);
    update();
  }

  void updateRelation(String value) {
    selectedRelationSetPref = capitalizeFirstLetter(value);
    update();
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  void setAge(String age){
    lowerAgeValue=double.parse(age);
    update();
  }

  void updateFields(User user) {
    //set gender, relation,language


    updateGender(user.gender);
    updateRelation(user.relationShip.toString());
    setUserLanguage(user.language.toString());
    setAge(user.age);
    ///set radioButton

    print(user.isSports.toString() + "*isSports");
    if (user.isSports.toString() == "1") {
      setSelectedSports(Questionnaire.yes);
    } else {
      setSelectedSports(Questionnaire.no);
    }

    /// set Alchol
    print(user.isAlcohol.toString());
    if (user.isAlcohol.toString() == "1") {
      setSelectedAlcohol(Questionnaire.yes);
    } else {
      setSelectedAlcohol(Questionnaire.no);
    }

    /// set Alchol
    print(user.wantChild.toString());
    if (user.wantChild.toString() == "1") {
      setSelectedWantChildren(Questionnaire.yes);
    } else {
      setSelectedWantChildren(Questionnaire.no);
    }

    print(user.hasChild.toString());
    if (user.hasChild.toString() == "1") {
      setSelectedHasChildren(Questionnaire.yes);
    } else {
      setSelectedHasChildren(Questionnaire.no);
    }

    print(user.isSmoker.toString());
    if (user.isSmoker.toString() == "1") {
      setSelectedSmoker(Questionnaire.yes);
    } else {
      setSelectedSmoker(Questionnaire.no);
    }

    /// age handling
    if (user.age.toString() == 'null') {
      lowerAgeValue = 19;
      update();
    } else if (double.parse(user.age.toString()) < 18) {
      lowerAgeValue = 18;
    } else {
      lowerAgeValue = double.parse(user.age);
    }

    /// height handling in cm
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
  }

  clearAll() {
    lowerValue.value = 18.0;
    upperValue.value = 70.0;
    lowerAgeValue = 18.0;
    filterUpperValue = 70.0;
    filterLowerValueMiles = 300.0;
    filterUpperValueMiles = 700.0;
    selectedMilesRange = 500.0;
    selectedMilesRangeDefault = 2490000.0;
    update();
  }

  Future<void> setPrefrencesApi(String lat,String lng) async {
    loadingUpdate.value=true;
    update();
    print(lowerAgeValue);
    await AuthProvider().sendProfilePreference(
        gender: selectedGender.value,
        height: heightLowerValue.toString(),
        relationShip: selectedRelationSetPref,
        age: lowerAgeValue.toString(),

        lat: lat,
        lng: lng,
        language: selectedGender.value,
        isSports: getSelectedSports()==Questionnaire.no?"0":"1",
        isAlcohol: getSelectedAlcohol()==Questionnaire.no?"0":"1",
        hasChild: getSelectedHasChildren()==Questionnaire.no?"0":"1",
        isSmoker: getSelectedSmoker()==Questionnaire.no?"0":"1",
        wantChild: getSelectedWantChildren()==Questionnaire.no?"0":"1");
    loadingUpdate.value=false;
    update();
  }
}
