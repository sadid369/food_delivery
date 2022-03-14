import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

import 'package:food_delivery/data/repository/popular_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedPopularProductRepo;

  RecommendedProductController({
    required this.recommendedPopularProductRepo,
  });

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedPopularProductRepo.getRecommendedProductList();

    if (response.statusCode == 200) {
      print("got products recommended");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      print(_recommendedProductList);
      _isLoaded = true;
      update();
    } else {
      print("could not got products recommended");
    }
  }
}
