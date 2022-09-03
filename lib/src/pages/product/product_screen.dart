import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/models/item_model.dart';
import 'package:pregue_a_palavra/src/services/util_services.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withAlpha(230),
        body: Stack(
          children: [
            //

            //Conteúdo
            Column(
              children: [
                Expanded(
                  child: Hero(tag: item.img, child: Image.network(item.img)),
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
                                  item.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 70,
                                color: Colors.red,
                              )
                            ],
                          ),

                          //Preço
                          Row(
                            children: [
                              Text(
                                utilServices.priceToCurrency(50.99),
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Color.fromARGB(255, 112, 112, 112),
                                    decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                utilServices.priceToCurrency(34.99),
                                style: TextStyle(
                                  fontSize: 23,
                                  color: CustomColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          //Descrição do livro
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 5),
                              child: SingleChildScrollView(
                                child: Text(
                                  'Diz o Pregador que há um tempo para tudo: nascer e morrer, plantar e colher, derrubar e edificar, chorar e rir, prantear e dançar. Há tempo para tudo mesmo! "Isto é filtro" solar nos ajuda a enxergar em nossa própria vida essas diferentes manifestações do tempo. Conduzindo-nos por uma profusão de referências musicais, literárias e cinematográficas, o Rev. Emilio põe diante de nossos olhos a efemeridade das coisas da terra e nosso desejo ardente de que algo seja permanente. Visto apenas debaixo do sol, este é de fato um mundo estranho, em que tristeza e tragédia nos tocam, o trabalho e as lutas são recorrentes, mas a alegria, o contentamento e o senso de direção se mostram a nós, mas logo desaparecem, como o mestre dos magos em Caverna do Dragão. Ainda assim, as pequenas alegrias que gozamos são indícios de que não pertencemos exclusivamente a este mundo debaixo do sol. O próprio Deus, ao encarnar-se, desceu do mundo acima do sol para nos fazer ver que a vida não se restringe ao tempo e que a eternidade está em nosso coração. Emilio não nos engana: quando o livro de Eclesiastes põe diante de nós verdades aparentemente paradoxais, somos levados à conclusão de que, na verdade, o problema está em nós, não no texto. Enfim, este que já foi chamado de o livro mais mal-humorado da Bíblia se mostra de maneira especialmente luminosa com a luz que vem de acima do sol. O que o Emilio faz é apenas nos ajudar a limpar as lentes dos óculos. Óculos de sol, com filtro UV, evidentemente.',
                                  style: TextStyle(fontSize: 16, height: 1.4),
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
                                onPressed: () {},
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
