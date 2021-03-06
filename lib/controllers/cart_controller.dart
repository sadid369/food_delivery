import 'package:flutter/material.dart';
import 'package:food_delivery/colors.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  List<CartModel> storageItems = [];
  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    print("Length of the item is ${_items.length} ");
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          price: value.price,
          name: value.name,
          img: value.img,
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
          isExist: true,
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            print(
                "Adding Item to the cart ID: ${product.id} Quantity: $quantity");
            _items.forEach((key, value) {
              print("quantity is ${value.quantity}");
            });
            return CartModel(
                id: product.id,
                price: product.price,
                name: product.name,
                img: product.img,
                quantity: quantity,
                time: DateTime.now().toString(),
                isExist: true,
                product: product);
          },
        );
      } else {
        Get.snackbar(
          "Item Count",
          "You Should at least add item in the cart",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  /// return true or false based on ProductModel instance. example -
  ///  bool existInCart(ProductModel product) {
  ///   if (_items.containsKey(product.id)) {
  ///     return true;
  ///   } else {
  ///     return false;
  ///    }
  ///  }
  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  ///return quantity of ProductModel
  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItem {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;

    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    print("Length of cart items  " + storageItems.length.toString());
    for (var i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }
}
