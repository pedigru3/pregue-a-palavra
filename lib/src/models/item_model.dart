import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) =>
    List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
  ItemModel(
      {required this.img,
      required this.normalPrice,
      required this.promoPrice,
      required this.title,
      required this.description,
      required this.stock});

  String img;
  double normalPrice;
  double promoPrice;
  String title;
  String description;
  int stock;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        img: json["img"],
        normalPrice: json["normal-price"],
        promoPrice: json["promo-price"],
        title: json["title"],
        description: json["description"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "normal-price": normalPrice,
        "promo-price": promoPrice,
        "title": title,
        "description": description,
        "stock": stock,
      };
}
