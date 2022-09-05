import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/models/cart_item_model.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/quantity_widget.dart';
import 'package:pregue_a_palavra/src/services/util_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        //imagem
        leading: Image.network(
          widget.cartItem.item.img,
          height: 60,
          width: 40,
          fit: BoxFit.cover,
        ),

        //Título
        title: Text(
          widget.cartItem.item.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),

        //Total
        subtitle: Text(
          utilServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(color: CustomColors.primaryColor),
        ),

        //Quantidade
        trailing: QuantityWidget(
            isRemovable: true,
            value: widget.cartItem.quantity,
            result: (qnt) {
              setState(() {
                widget.cartItem.quantity = qnt;
                if (qnt == 0) {
                  widget.remove(widget.cartItem);
                }
              });
            }),
      ),
    );
  }
}
