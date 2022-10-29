import 'package:pregue_a_palavra/src/models/cart_item_model.dart';
import 'package:pregue_a_palavra/src/models/item_model.dart';
import 'package:pregue_a_palavra/src/models/order_model.dart';
import 'package:pregue_a_palavra/src/models/user_model.dart';

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
      stock: 10,
      img: 'https://images-na.ssl-images-amazon.com/images/I/815HDrXj5ZL.jpg',
      normalPrice: 32.5,
      promoPrice: 20.5,
      title: 'Branca de Neve e os sete anões',
      description:
          "Branca de neve é vítima da inveja de sua madrasta. Ela foge e se esconde na casa de sete pequenos trabalhadores na floresta. O que branca não sabe é que a terrível madrasta conhece seu paradeiro."),
  ItemModel(
      stock: 10,
      img: 'https://images-na.ssl-images-amazon.com/images/I/71yJLhQekBL.jpg',
      normalPrice: 110.99,
      promoPrice: 60.6,
      title: 'As crônicas de Nárnia',
      description:
          "Viagens ao fim do mundo, criaturas fantásticas e batalhas épicas entre o bem e o mal - o que mais um leitor poderia querer de um livro? O livro que tem tudo isso é 'O leão, a feiticeira e o guarda-roupa', escrito em 1949 por Clive Staples Lewis. MasLewis não parou por aí. Seis outros livros vieram depois e, juntos, ficaram conhecidos como 'As crônicas de Nárnia'. Nos últimos cinqüenta anos, 'As crônicas de Nárnia' transcenderam o gênero da fantasia para se tornar parte do cânone da literaturaclássica. Cada um dos sete livros é uma obra-prima, atraindo o leitor para um mundo em que a magia encontra a realidade, e o resultado é um mundo ficcional que tem fascinado gerações. Esta edição apresenta todas as sete crônicas integralmente, num único volume. Os livros são apresentados de acordo com a ordem de preferência de Lewis, cada capítulo com uma ilustração do artista original, Pauline Baynes. Enganosamente simples e direta, 'As crônicas de Nárnia' continuam cativando os leitores com aventuras, personagens e fatos que falam a pessoas de todas as idades."),
  ItemModel(
      stock: 10,
      img: 'https://images-na.ssl-images-amazon.com/images/I/819g2Qrd-zL.jpg',
      normalPrice: 99.0,
      promoPrice: 80.9,
      title: 'Teologia Sistemática atual e exaustiva',
      description:
          "Obra incrivelmente atual e pertinente. Responde às perguntas que se fazem hoje (ordenação de pastoras; batalha espiritual, anjos, criação/evolução, dons do Espírito) além de tratar de todas as outras doutrinas clássicas do cristianismo."),
];

List<CartItemModel> cartItems = [
  CartItemModel(item: listItems[0], quantity: 2),
  CartItemModel(item: listItems[1], quantity: 2),
  CartItemModel(item: listItems[2], quantity: 1),
];

UserModel user = UserModel(
  fullname: 'Felipe Ferreira da Silva',
  email: 'ferreira@pregueapalavra.com',
  phone: '(11) 94344-4434',
  cpf: '432.532.095-56',
  password: '123abc',
  id: '',
  token: '',
);

List<OrderModel> orders = [
  OrderModel(
    copyAndPast: '#kdkd',
    createdDateTime: DateTime.parse('2021-06-08 10:00:10.434'),
    overdueDateTime: DateTime.parse('2022-09-16 10:00:10.434'),
    id: '#1293094d',
    status: 'pending_payment',
    total: 120,
    items: [
      CartItemModel(item: listItems[1], quantity: 2),
      CartItemModel(item: listItems[2], quantity: 1),
      CartItemModel(item: listItems[0], quantity: 1),
    ],
  ),
  OrderModel(
    copyAndPast: '#kdkd',
    createdDateTime: DateTime.parse('2021-06-08 10:00:10.434'),
    overdueDateTime: DateTime.parse('2022-11-26 10:00:10.434'),
    id: '#1293094d',
    status: 'delivered',
    total: 120,
    items: [
      CartItemModel(item: listItems[1], quantity: 2),
      CartItemModel(item: listItems[2], quantity: 1),
      CartItemModel(item: listItems[0], quantity: 1),
    ],
  ),
];
