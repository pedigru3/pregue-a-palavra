// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:pregue_a_palavra/src/constants/books_bible.dart';
import 'package:pregue_a_palavra/src/constants/default_chapter.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/pages/bible/repository/bible_repository.dart';
import 'package:pregue_a_palavra/src/services/app_settings.dart';

class BibleController extends ChangeNotifier {
  bool isLoading = false;

  final AppSettings _prefs = AppSettings();

  final bibleRepository = BibleRepository();

  BibleController() {
    _initalGetData();
  }

  BibleModel bible = BibleModel.fromJson(DefaultChapter.genesis);

  String abbrev = 'gn';

  int chapter = 1;

  _initalGetData() async {
    isLoading = true;
    bible = await _prefs.getData();
    isLoading = false;
    notifyListeners();
  }

  Future<void> search() async {
    print('buscando dados no servidor');
    isLoading = true;
    Map<String, dynamic> map = await bibleRepository.getverses(abbrev, chapter);
    BibleModel result = BibleModel.fromJson(map);
    //filter
    final book = BooksBible.books.where((e) {
      final match = e.abbrev.pt;
      return match.contains(result.book.abbrev.pt);
    }).toList();
    //
    bible = result.copyWith(book: book.first);
    isLoading = false;
    _prefs.save(bible);
    notifyListeners();
  }

  set setBook(String book) {
    abbrev = book;
    notifyListeners();
  }

  set setChapter(int chapter) {
    this.chapter = chapter;
    notifyListeners();
  }

  void nextChapter() {
    if (chapter < bible.book.chapters!) {
      chapter++;
      search();
      notifyListeners();
    } else {
      nextBook();
    }
  }

  void previousChapter() {
    if (chapter > 1) {
      chapter--;
      search();
      notifyListeners();
    }
  }

  void nextBook() {
    final newList = BooksBible.books.map((e) => e.abbrev.pt).toList();
    int index = newList.indexOf(abbrev);
    if (index < newList.length - 1) {
      index++;
    }
    abbrev = newList.elementAt(index);
    chapter = 1;
    search();
    notifyListeners();
  }

  void previousBook() {
    final newList = BooksBible.books.map((e) => e.abbrev.pt).toList();
    int index = newList.indexOf(abbrev);
    if (index > 0) {
      index--;
    }
    abbrev = newList.elementAt(index);
    chapter = 1;
    search();
    notifyListeners();
  }

  void selecionar(int index) async {
    bible.verses[index].isSelected = !bible.verses[index].isSelected;
    bible = bible.copyWith();
    notifyListeners();
    await _prefs.save(bible);
  }
}
