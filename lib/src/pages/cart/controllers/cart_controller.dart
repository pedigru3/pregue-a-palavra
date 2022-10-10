import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/models/item_model.dart';

class CartController extends ChangeNotifier {
  List<ItemModel> cart = [];

  addToCart(ItemModel item) {
    cart.add(item);
    notifyListeners();
    print('adicionado no carrinho');
  }
}
