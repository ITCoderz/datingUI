import 'package:dating/screens/auth/controllers/auth_controllers.dart';
import 'package:dating/screens/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';


class InitializingDependency implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => OnboardingController(),
      fenix: true
    );
    Get.lazyPut(
            () => AuthController(),
        fenix: true
    );
  }
}
