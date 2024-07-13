import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/screens/auth/views/starting_screen.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var pageIndex = 0.obs;
  final CarouselController carouselController = CarouselController();

  void nextPage() {
    if (pageIndex < 2) {
      pageIndex++;
      carouselController.nextPage();
    }
    update();
  }

  void previousPage() {
    if (pageIndex > 0) {
      pageIndex--;
      carouselController.previousPage();
    }
    update();
  }

  void skip() {
    Get.offAll(()=> const StartingScreen());
  }
}
