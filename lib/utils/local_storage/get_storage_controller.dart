
import 'package:dating/models/api_models/login_model.dart';
import 'package:dating/screens/auth/views/login_screen.dart';
import 'package:dating/utils/constants/constant_keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController implements GetxService {
  final box = GetStorage();

  Future<void> initStorage() async {
    await GetStorage().initStorage;
  }

  bool isHavingData = false;

  toggleIsHavingData(bool value) {
    isHavingData = value;
    update();
  }

  String? writeStorage({required String key, required String value}) {
    box.write(key, value);
    toggleIsHavingData(true);
    return null;
  }

  storeLoginModel(LoginModel m) {
    box.write('getLoginValues', m.toJson());
    update();
  }
  LoginModel? getLoginModel() {
    final resp = box.read('getLoginValues');
    update();
    if (resp != null) {
      return LoginModel.fromJson((resp));
    } else {
      return null;
    }
  }



  Future<void> removeStorage() async {
    await box.remove('getDoctorLoginValues');
    await box.remove('getLoginValues');
    await box.remove('doctorPasswordKey');
    await box.remove('patientPasswordKey');
    toggleIsHavingData(false);
    update();
    Get.offAll(() => const LoginScreen());
  }

}
