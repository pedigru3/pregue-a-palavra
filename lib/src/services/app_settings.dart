import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/constants/default_chapter.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  SharedPreferences? _prefs;

  BibleModel defaultChapter = BibleModel.fromJson(DefaultChapter.genesis);

  Future<void> _startPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> save(BibleModel bibleModel) async {
    await _startPreferences();
    print('salvando no banco de dados');
    final bibleJson = bibleModelToJson(bibleModel);
    await _prefs!.setString('bibleJson', bibleJson);
  }

  Future<BibleModel> getData() async {
    await _startPreferences();
    print('recuperando do banco de dados');
    final data =
        _prefs!.getString('bibleJson') ?? bibleModelToJson(defaultChapter);
    return bibleModelFromJson(data);
  }
}
