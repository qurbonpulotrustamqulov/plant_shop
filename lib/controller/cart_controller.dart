import 'package:flutter/material.dart';
import 'package:plants_shop/models/plant.dart';

class CartController with ChangeNotifier {
  Cart _cart = Cart(id: 1, items: []);

  void addToCard({required PlantModel product, required int quantity}) {
    final isExist = _cart.items.any((element) => element.id == product.id);
    if (isExist) {
      final item =
          _cart.items.firstWhere((element) => element.id == product.id);
      if (quantity == 1) {
        item.quantity++;
      } else if (quantity == -1 && item.quantity > 0) {
        item.quantity--;
      }

      item.total = item.quantity * item.plantModel.price;
      if (item.quantity == 0) {
        _cart.items.remove(item);
      }
    } else if (quantity == 1) {
      final cartItem = CartItem(id: product.id, plantModel: product);
      _cart.items.add(cartItem);
    }
    _cart = _cart.copyWith(items: _cart.items);
    notifyListeners();
  }

  Cart get cart => _cart;
}
