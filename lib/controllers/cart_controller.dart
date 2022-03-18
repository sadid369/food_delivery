import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  void addItem(ProductModel product, int quantity) {
    print("Length of the item is ${_items.length} ");
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        return CartModel(
          id: value.id,
          price: value.price,
          name: value.name,
          img: value.img,
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
          isExist: true,
        );
      });
    } else {
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
          );
        },
      );
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }
}
