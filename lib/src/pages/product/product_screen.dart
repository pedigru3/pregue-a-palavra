import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/models/item_model.dart';
import 'package:pregue_a_palavra/src/pages/cart/controllers/cart_controller.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/quantity_widget.dart';
import 'package:pregue_a_palavra/src/services/util_services.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilServices utilServices = UtilServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CartController>();
    return Scaffold(
        backgroundColor: Colors.white.withAlpha(230),
        body: Stack(
          children: [
            //

            //Conteúdo
            Column(
              children: [
                Expanded(
                  child: SafeArea(
                    child: Hero(
                        tag: widget.item.img,
                        child: Image.network(
                          widget.item.img,
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: CustomColors.primaryColor,
                              offset: const Offset(0, 2))
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                //Nome do Livro
                                child: Text(
                                  widget.item.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              //Botão Quantidade
                              QuantityWidget(
                                  value: cartItemQuantity,
                                  result: (qnt) {
                                    setState(() {
                                      cartItemQuantity = qnt;
                                    });
                                  })
                            ],
                          ),

                          //Preço
                          Row(
                            children: [
                              Text(
                                utilServices
                                    .priceToCurrency(widget.item.normalPrice),
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Color.fromARGB(255, 112, 112, 112),
                                    decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                utilServices
                                    .priceToCurrency(widget.item.promoPrice),
                                style: TextStyle(
                                  fontSize: 23,
                                  color: CustomColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          //Descrição do livro
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 5),
                              child: SingleChildScrollView(
                                child: Text(
                                  widget.item.description,
                                  style: const TextStyle(
                                      fontSize: 16, height: 1.4),
                                ),
                              ),
                            ),
                          ),

                          //botão
                          SizedBox(
                            height: 55,
                            child: ElevatedButton.icon(
                                icon: const Icon(Icons.shopping_cart_outlined),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                                onPressed: () {
                                  controller.addToCart(widget.item);
                                },
                                label: const Text(
                                  'Adcionar ao carrinho',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ]),
                  ),
                )
              ],
            ),

            Positioned(
              left: 10,
              top: 10,
              child: SafeArea(
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios))),
            )
          ],
        ));
  }
}
