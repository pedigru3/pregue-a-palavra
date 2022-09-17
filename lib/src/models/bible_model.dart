// To parse this JSON data, do
//
//     final bibleModel = bibleModelFromJson(jsonString);

import 'dart:convert';

BibleModel bibleModelFromJson(String str) =>
    BibleModel.fromJson(json.decode(str));

String bibleModelToJson(BibleModel data) => json.encode(data.toJson());

class BibleModel {
  BibleModel({
    required this.book,
    required this.chapter,
    required this.verses,
  });

  final Book book;
  final Chapter chapter;
  final List<Verse> verses;

  factory BibleModel.fromJson(Map<String, dynamic> json) => BibleModel(
        book: Book.fromJson(json["book"]),
        chapter: Chapter.fromJson(json["chapter"]),
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "book": book.toJson(),
        "chapter": chapter.toJson(),
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
      };
}

class Book {
  Book({
    required this.abbrev,
    required this.name,
    required this.author,
    required this.group,
    required this.version,
  });

  final Abbrev abbrev;
  final String name;
  final String author;
  final String group;
  final String version;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        abbrev: Abbrev.fromJson(json["abbrev"]),
        name: json["name"],
        author: json["author"],
        group: json["group"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "abbrev": abbrev.toJson(),
        "name": name,
        "author": author,
        "group": group,
        "version": version,
      };
}

class Abbrev {
  Abbrev({
    required this.pt,
    required this.en,
  });

  final String pt;
  final String en;

  factory Abbrev.fromJson(Map<String, dynamic> json) => Abbrev(
        pt: json["pt"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "pt": pt,
        "en": en,
      };
}

class Chapter {
  Chapter({
    required this.number,
    required this.verses,
  });

  final int number;
  final int verses;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        number: json["number"],
        verses: json["verses"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "verses": verses,
      };
}

class Verse {
  Verse({
    required this.number,
    required this.text,
  });

  final int number;
  final String text;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: json["number"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
      };
}
