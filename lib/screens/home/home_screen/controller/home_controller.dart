import 'package:get/get.dart';

enum Gender { male, female, both }

enum Language { french, english, spanish }

enum Relationship { serious, fun, friends }

enum Questionnaire { yes, no }

class HomeController extends GetxController {
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
  var favourite=true.obs;
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
}
