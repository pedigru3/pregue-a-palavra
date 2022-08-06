import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
    ItemModel({
        required this.img,
        required this.link,
        required this.normalPrice,
        required this.promoPrice,
        required this.title,
    });

    String img;
    String link;
    String normalPrice;
    String promoPrice;
    String title;

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        img: json["img"],
        link: json["link"],
        normalPrice: json["normal-price"],
        promoPrice: json["promo-price"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
        "link": link,
        "normal-price": normalPrice,
        "promo-price": promoPrice,
        "title": title,
    };
}