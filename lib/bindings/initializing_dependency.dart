import 'package:dating/screens/auth/controllers/auth_controllers.dart';
import 'package:dating/screens/home/home_screen/controller/home_controller.dart';
import 'package:dating/screens/home/profile/controllers/edit_profile_controllers.dart';
import 'package:dating/screens/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

import '../screens/auth/views/prefrences/prefrences_conntroller.dart';
import '../screens/home/chat/message_screen/controller/messages_controller.dart';
import '../screens/home/home_screen/view/favrt_conntroller.dart';





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
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => PrefrencesConntroller(), fenix: true);

    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => FavouriteController(), fenix: true);
  }
}
