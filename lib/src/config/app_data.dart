import 'package:pregue_a_palavra/src/models/cart_item_model.dart';
import 'package:pregue_a_palavra/src/models/item_model.dart';

List<String> categories = [
  "Aconselhamento",
  "Apologética",
  "Comentário Bíblico",
  "Criacionismo",
  "Devocional",
  "Discipulado",
  "Educação Cristã",
];

List<ItemModel> listItems = [
  ItemModel(
    img: 'https://images-na.ssl-images-amazon.com/images/I/815HDrXj5ZL.jpg',
    link: 'https://images-na.ssl-images-amazon.com/images/I/815HDrXj5ZL.jpg',
    normalPrice: '32',
    promoPrice: '20',
    title: 'Branca de Neve e os sete anões',
  ),
  ItemModel(
    img: 'https://images-na.ssl-images-amazon.com/images/I/71yJLhQekBL.jpg',
    link: 'https://images-na.ssl-images-amazon.com/images/I/71yJLhQekBL.jpg',
    normalPrice: '100',
    promoPrice: '50',
    title: 'As crônicas de Nárnia',
  ),
  ItemModel(
    img: 'https://images-na.ssl-images-amazon.com/images/I/819g2Qrd-zL.jpg',
    link: 'https://images-na.ssl-images-amazon.com/images/I/819g2Qrd-zL.jpg',
    normalPrice: '99',
    promoPrice: '132',
    title: 'Teologia Sistemática atual e exaustiva',
  ),
];

List<CartItemModel> cartItems = [
  CartItemModel(item: listItems[0], quantity: 2),
  CartItemModel(item: listItems[1], quantity: 2),
  CartItemModel(item: listItems[2], quantity: 1),
];
