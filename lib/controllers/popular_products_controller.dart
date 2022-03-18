import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/colors.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

import 'package:food_delivery/data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({
    required this.popularProductRepo,
  });

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _intCartItem = 0;
  int get inCartItem => _intCartItem + _quantity;
  late CartController _cart;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      print("increment" + _quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        "Item Count",
        "You Can't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        "Item Count",
        "You Can't Add More",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _intCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //if exist
    // get from storage _inCartItems =
    print("${exist}");
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _cart.items.forEach((key, value) {
        print("ID: ${value.id} Quantity: ${value.quantity}");
      });
    } else {
      Get.snackbar(
        "Item Count",
        "You Should at least add item in the cart",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
  }
}
