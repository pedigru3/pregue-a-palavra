import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/models/item_model.dart';
import 'package:pregue_a_palavra/src/pages/product/product_screen.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Conteúdo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return const ProductScreen();
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
                  Image(
                    width: 300,
                    fit: BoxFit.contain,
                    image: NetworkImage(item.img),
                  ),

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
                        item.normalPrice,
                        style: const TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        item.promoPrice,
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
          child: GestureDetector(
            onTap: () {},
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
        ),
      ],
    );
  }
}
