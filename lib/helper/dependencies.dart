import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_products_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/recommended_product_contoller.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(
    () => ApiClient(
      appBaseUrl: AppConstants.BASE_URL,
    ),
  );
  //repos
  Get.lazyPut(
    () => PopularProductRepo(
      apiClient: Get.find(),
    ),
  );
  Get.lazyPut(
    () => RecommendedProductRepo(
      apiClient: Get.find(),
    ),
  );
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  //controllers
  Get.lazyPut(
    () => PopularProductController(
      popularProductRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () =>
        RecommendedProductController(recommendedPopularProductRepo: Get.find()),
  );
  Get.lazyPut(
    () => CartController(
      cartRepo: Get.find(),
    ),
  );
}
