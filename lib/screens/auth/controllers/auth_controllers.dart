import 'dart:io';

import 'package:dating/api_providers/auth_provider.dart';
import 'package:dating/screens/auth/views/congratulations_screen.dart';
import 'package:dating/screens/home/home_screen/view/home_screen.dart';
import 'package:dating/utils/local_storage/get_storage_controller.dart';
import 'package:dating/utils/snackbar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController mmController = TextEditingController();
  TextEditingController ddController = TextEditingController();
  TextEditingController yyyyController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  RxBool loading = false.obs;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final hidePassword = true.obs;
  final hidePassword2 = true.obs;

  Rx<File?> userProfileImage = Rx<File?>(null);

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      userProfileImage.value = File(pickedFile.path);
      update();
    }
  }
  togglePasswordVisibility() {
    hidePassword.value = !hidePassword.value;
  }

  togglePasswordVisibility2() {
    hidePassword2.value = !hidePassword2.value;
  }

  // Image selection logic
  RxList images = [].obs;

  RxString selectedGender = ''.obs;

  updateGender(value) {
    selectedGender.value = value;
  }


  RxString selectedRelation = ''.obs;

  updateRelation(value) {
    selectedRelation.value = value;
  }

  selectImage() async {
    XFile? selectedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery);
    if (selectedImage != null) {
      File convertedFile = File(selectedImage.path);
      images.add(convertedFile.path);
      update();
    } else {
      debugPrint("No image selected!");
    }
  }

  // Field validation logic
  String? validateEmail(String? value) {
    String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Enter your email";
    } else if (!regex.hasMatch(value)) {
      return "Invalid email";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? validateContact(String value) {
    if (value.isEmpty) {
      return 'Please enter your contact number';
    }
    return null;
  }

  String? validateHeight(String value) {
    if (value.isEmpty) {
      return 'Please enter your height';
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.isEmpty) {
      return 'Please enter your city';
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

  // Method to validate all fields
  bool validateAllFields() {
    print(selectedGender.toString());
    if (validateEmail(emailController.text) != null ||
        validateName(fullNameController.text) != null ||
        validateContact(contactController.text) != null ||
        validateHeight(heightController.text) != null ||
        selectedGender.toString().isEmpty||
        validateCity(cityController.text) != null) {
      return false;
    }
    return true;
  }

  Future<void> register() async {
    if (!validateAllFields()) {
      SnackBarAlerts.warningAlert(message: "Please fill all fields correctly.");
      return;
    }


    // Combine date parts into one string
    String dob = "${yyyyController.text}-${mmController.text}-${ddController
        .text}";

    // Start loading
    loading.value = true;

    try {
      if(userProfileImage.value!=null){
        bool? result = await AuthProvider().registerUser(
          fullName: fullNameController.text,
          email: emailController.text,
          contact: contactController.text,
          gender: selectedGender.value,
          // This can be dynamic based on your form
          height: heightController.text,
          relationshipStatus: selectedRelation.value,
          // This can be dynamic based on your form
          city: cityController.text,
          dob: dob,
          password: passwordController.text,
          passwordConfirmation: cpasswordController.text,
          age: "25",
          userImagePath:userProfileImage.value!.path ,
          imagePaths: images,
        );
        if (result) {
          SnackBarAlerts.successAlert(message: "Registration successful!");

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
          cpasswordController.clear();
          // Clear images and selections
          images.clear();
          selectedGender.value = '';
          selectedRelation.value = '';
          update();
          Get.to(() => const CongratulationsScreen());
        } else {
          SnackBarAlerts.warningAlert(
              message: "Registration failed. Please try again.");
        }
      }
      else{
        SnackBarAlerts.warningAlert(message: "Please Select Profile Image");
      }


      // Stop loading
      loading.value = false;


    } catch (e) {
      loading.value = false;
      SnackBarAlerts.warningAlert(message: "An error occurred: $e");
    }
  }

  Future<void> login() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      SnackBarAlerts.warningAlert(
          message: "Please enter both email and password.");
      return;
    }

    // Start loading
    loading.value = true;

    try {
      bool? result = await AuthProvider().loginUser(
        email: emailController.text,
        password: passwordController.text,
      );

      // Stop loading
      loading.value = false;

      if (result) {
        SnackBarAlerts.successAlert(message: "Login successful!");
        Get.find<StorageController>().writeStorage(key: "log", value: 'true');
        Get.offAll(()=> HomeScreen());
      } else {
        SnackBarAlerts.warningAlert(message: "Login failed. Please try again.");
      }
    } catch (e) {
      loading.value = false;
      SnackBarAlerts.warningAlert(message: "An error occurred: $e");
    }
  }

  Future<void> sendOtp() async {
    if (emailController.text.isEmpty ) {
      SnackBarAlerts.warningAlert(
          message: "Please enter email");
      return;
    }

    // Start loading
    loading.value = true;

    try {
       await AuthProvider().sendOtp(emailController.text);

      // Stop loading
      loading.value = false;

      // if (result) {
      //   SnackBarAlerts.successAlert(message: "Login successful!");
      //   Get.find<StorageController>().writeStorage(key: "log", value: 'true');
      //   Get.offAll(()=> HomeScreen());
      // } else {
      //   SnackBarAlerts.warningAlert(message: "Login failed. Please try again.");
      // }
    } catch (e) {
      loading.value = false;
      SnackBarAlerts.warningAlert(message: "An error occurred: $e");
    }
  }

  bool isValidDate(dynamic day, dynamic month, dynamic year) {
    // Check if inputs are not null
    if (day == null || month == null || year == null) {
      return false;
    }

    // Ensure inputs are integers
    if (day is! int || month is! int || year is! int) {
      return false;
    }

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

