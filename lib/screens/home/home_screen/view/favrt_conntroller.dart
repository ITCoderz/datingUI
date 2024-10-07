import 'package:dating/api_providers/auth_provider.dart';
import 'package:dating/models/api_models/get_all_favrt.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FavouriteController extends GetxController {
  var isLoading = true.obs; // To manage loading state
  var items = <FavouriteModelObj>[].obs; // Replace with your data type

  @override
  void onInit() {
    fetchItems(); // Fetch items when the controller is initialized
    super.onInit();
  }

  Future<void> fetchItems() async {
    isLoading.value = true; // Set loading state to true
    // Simulate a network request or fetch your data here
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay
    items.value =
        await getData(); // Replace with your actual data fetching logic
    isLoading.value = false; // Set loading state to false
  }

  Future<List<FavouriteModelObj>> getData() async {
    var data = await AuthProvider().fetchFavouriteData();

    update();
    return data!.data;
  }

  storeFavrt(String userId) async {
    await AuthProvider().addToFavorites(userId);
  }
}
