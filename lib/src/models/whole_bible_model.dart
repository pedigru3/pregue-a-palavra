// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pregue_a_palavra/src/models/bible_model.dart';

class WholeBibleModel {
  Map<String, BibleModel> bible = {};

  addBible(BibleModel bibleModel) {
    String abbrev = bibleModel.book.abbrev.pt;
    if (!bible.containsKey(abbrev)) {
      bible[abbrev] = bibleModel;
    }
  }
}
