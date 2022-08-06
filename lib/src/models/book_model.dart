class BookModel {
  Abbrev? abbrev;
  String? author;
  int? chapters;
  String? group;
  String? name;
  String? testament;

  BookModel(
      {this.abbrev,
      this.author,
      this.chapters,
      this.group,
      this.name,
      this.testament});

  BookModel.fromJson(Map<String, dynamic> json) {
    abbrev = json['abbrev'] != null ? Abbrev.fromJson(json['abbrev']) : null;
    author = json['author'];
    chapters = json['chapters'];
    group = json['group'];
    name = json['name'];
    testament = json['testament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abbrev != null) {
      data['abbrev'] = abbrev!.toJson();
    }
    data['author'] = author;
    data['chapters'] = chapters;
    data['group'] = group;
    data['name'] = name;
    data['testament'] = testament;
    return data;
  }
}

class Abbrev {
  String? pt;
  String? en;

  Abbrev({this.pt, this.en});

  Abbrev.fromJson(Map<String, dynamic> json) {
    pt = json['pt'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pt'] = pt;
    data['en'] = en;
    return data;
  }
}
