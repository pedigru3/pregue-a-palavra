import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/models/item_model.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Imagem
            Image(
              image: NetworkImage(item.img),
            ),
            // Nome
            Text(item.title),

            // Preço
            Text(item.promoPrice),
          ],
        ),
      ),
    );
  }
}
