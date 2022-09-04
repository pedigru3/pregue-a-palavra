import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/models/cart_item_model.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;

  const CartTile({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //imagem
        leading: Image.network(
          cartItem.item.img,
          height: 60,
          width: 40,
          fit: BoxFit.cover,
        ),

        //Título

        //Total

        //Botão
      ),
    );
  }
}
