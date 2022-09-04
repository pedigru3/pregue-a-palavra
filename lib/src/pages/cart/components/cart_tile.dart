import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/models/cart_item_model.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/quantity_widget.dart';
import 'package:pregue_a_palavra/src/services/util_services.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;

  CartTile({Key? key, required this.cartItem}) : super(key: key);

  final UtilServices utilServices = UtilServices();

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
        title: Text(
          cartItem.item.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),

        //Total
        subtitle: Text(
          utilServices.priceToCurrency(50),
          style: TextStyle(color: CustomColors.primaryColor),
        ),

        //Botão
        trailing: QuantityWidget(
            value: cartItem.quantity,
            result: (qnt) {
              cartItem.quantity = qnt;
            }),
      ),
    );
  }
}
