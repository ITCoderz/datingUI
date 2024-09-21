import 'package:dating/screens/auth/controllers/auth_controllers.dart';
import 'package:dating/screens/home/home_screen/controller/home_controller.dart';
import 'package:dating/screens/home/profile/controllers/edit_profile_controllers.dart';
import 'package:dating/screens/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

import '../screens/home/chat/message_screen/controller/messages_controller.dart';





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
    Get.lazyPut(
            () => MessagesController(),
        fenix: true
    );
    Get.lazyPut(
            () => ProfileController(),
        fenix: true
    );
    // Get.lazyPut(
    //         () => HomeController(),
    //     fenix: true
    // );
  }
}
