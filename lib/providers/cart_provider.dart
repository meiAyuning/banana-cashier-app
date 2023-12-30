import 'package:bananacashierapp/models/cart_item.dart';
import 'package:flutter/material.dart';

List<CartItem> _cart = [];

class CartProvider with ChangeNotifier {
  List<CartItem> get cart => _cart;
  // int _total = 0;
  // int get total => _total;

  void addRemove(int id, bool isAdd) {
    if (_cart.where((element) => id == element.id).isNotEmpty) {
      // sudah mengandung id yang diklik
      var index = _cart.indexWhere((element) => element.id == id);
      _cart[index].quantity = (isAdd)
          ? _cart[index].quantity + 1
          : (_cart[index].quantity > 0)
              ? _cart[index].quantity - 1
              : 0;
      // _total = (isAdd)
      //     ? _total + 1
      //     : (_total > 0)
      //         ? _total - 1
      //         : 0;
    } else {
      // belum ada
      _cart.add(CartItem(id: id, name: "", price: 1, image: "", quantity: 1, total: 1));
      // _total = _total + 1;
    }

    notifyListeners();
  }
}
