import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/models/item_model.dart';
import 'package:pregue_a_palavra/src/pages/cart/controllers/cart_controller.dart';
import 'package:pregue_a_palavra/src/pages/product/product_screen.dart';
import 'package:pregue_a_palavra/src/services/util_services.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Conteúdo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return ProductScreen(item: item);
            }));
          },
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagem
                  Hero(
                      tag: item.img,
                      child: Image(
                        width: 300,
                        fit: BoxFit.contain,
                        image: NetworkImage(item.img),
                      )),

                  // Nome do Produto
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      item.title,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Preço
                  Row(
                    children: [
                      Text(
                        utilServices.priceToCurrency(item.normalPrice),
                        style: const TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        utilServices.priceToCurrency(item.promoPrice),
                        style: TextStyle(
                            color: CustomColors.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        //Botão
        Positioned(
          top: 2,
          right: 2,
          child: Container(
            width: 32,
            height: 42,
            decoration: BoxDecoration(
              color: CustomColors.primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(10)),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
