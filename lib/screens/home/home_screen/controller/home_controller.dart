import 'package:get/get.dart';

enum Gender { male, female, both }

class HomeController extends GetxController {

  var lowerValue = 18.0.obs;
  var upperValue = 60.0.obs;
  var filterlowerValue = 18.0;
  var filterupperValue = 70.0;
  var filterlowerValueMiles = 300.0;
  var filterupperValueMiles = 700.0;
  var selectedMilesRange = 0.0;
  var selectedMilesRangeDefault = 2490000.0;
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
  clearAll() {

    lowerValue.value = 18.0;
    upperValue.value = 70.0;

    filterlowerValue = 18.0;
    filterupperValue = 70.0;
    filterlowerValueMiles = 300.0;
    filterupperValueMiles = 700.0;
    selectedMilesRange = 500.0;
    selectedMilesRangeDefault = 2490000.0;
    update();
  }
}