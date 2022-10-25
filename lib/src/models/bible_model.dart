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

  copyWith({
    Book? book,
    Chapter? chapter,
    List<Verse>? verses,
  }) {
    return BibleModel(
      book: book ?? this.book,
      chapter: chapter ?? this.chapter,
      verses: verses ?? this.verses,
    );
  }

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

List<Book> bookModelFromList(List list) =>
    List<Book>.from(list.map((x) => Book.fromJson(x)));

class Book {
  Book({
    required this.abbrev,
    required this.name,
    required this.author,
    required this.group,
    this.version,
    this.chapters,
    this.testament,
  });

  final Abbrev abbrev;
  final String name;
  final String author;
  final String group;
  final String? version;
  final int? chapters;
  final String? testament;

  copyWith(
      {Abbrev? abbrev,
      String? name,
      String? author,
      String? group,
      String? version,
      int? chapters,
      String? testament}) {
    return Book(
        abbrev: abbrev ?? this.abbrev,
        name: name ?? this.name,
        author: author ?? this.author,
        group: group ?? this.group,
        version: version ?? this.version,
        chapters: chapters ?? this.chapters,
        testament: testament ?? this.testament);
  }

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        abbrev: Abbrev.fromJson(json["abbrev"]),
        name: json["name"],
        author: json["author"],
        group: json["group"],
        version: json["version"],
        chapters: json["chapters"],
        testament: json["testament"],
      );

  Map<String, dynamic> toJson() => {
        "abbrev": abbrev.toJson(),
        "name": name,
        "author": author,
        "group": group,
        "version": version,
        "chapters": chapters,
        "testament": testament,
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
  Verse({required this.number, required this.text, this.isSelected = false});

  final int number;
  final String text;
  bool isSelected;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: json["number"],
        text: json["text"],
        isSelected: json["isSelected"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
        "isSelected": isSelected,
      };
}
