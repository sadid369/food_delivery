import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/colors.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/cart_model.dart';
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
      print("Number of item ${_quantity}");
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("Number of item ${_quantity}");
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_intCartItem + quantity) < 0) {
      Get.snackbar(
        "Item Count",
        "You Can't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_intCartItem > 0) {
        _quantity = -_intCartItem;
        return _quantity;
      }
      return 0;
    } else if ((_intCartItem + quantity) > 20) {
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

  ///
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _intCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print(exist.toString());
    if (exist) {
      _intCartItem = _cart.getQuantity(product);
    }
    print("The quantity in the cart is ${_intCartItem}");
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _intCartItem = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("ID: ${value.id} Quantity: ${value.quantity}");
    });
    update();
  }

  int get totalItems {
    return _cart.totalItem;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
