import 'package:bananacashierapp/models/cart_item.dart';
import 'package:flutter/material.dart';

List<CartItem> _cart = [];

class CartProvider with ChangeNotifier {
  List<CartItem> get cart => _cart;
  int idCart = 0;
  int _subTotal = 0;
  int get total => this.caculateTotal();

  void addRemove(int id, bool isAdd, List data) {
    if (_cart
        .where((element) => id == element.id && data[4] == element.tipe)
        .isNotEmpty) {
      // sudah mengandung id yang diklik
      var index = _cart
          .indexWhere((element) => element.id == id && element.tipe == data[4]);
      _cart[index].quantity = (isAdd)
          ? _cart[index].quantity + 1
          : (_cart[index].quantity > 0)
              ? _cart[index].quantity - 1
              : 0;
      _subTotal = _cart[index].subTotal;
      _subTotal = (isAdd)
          ? _subTotal += _cart[index].price
          : (_subTotal > 0)
              ? _subTotal -= _cart[index].price
              : 0;
      _cart[index].subTotal = _subTotal;
      _subTotal = 0;
    } else {
      _cart.add(CartItem(
          id: id,
          idCart: idCart,
          name: data[1],
          price: int.parse(data[2]),
          image: data[3],
          quantity: 1,
          subTotal: int.parse(data[2]),
          tipe: data[4]));
      idCart += 1;
      // _total = _total + 1;
    }

    notifyListeners();
  }

  int caculateTotal() {
    int total = 0;
    for (var cart in _cart) {
      total += cart.subTotal;
    }
    return total;
  }
}
