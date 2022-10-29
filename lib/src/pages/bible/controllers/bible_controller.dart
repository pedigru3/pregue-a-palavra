// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:pregue_a_palavra/src/constants/books_bible.dart';
import 'package:pregue_a_palavra/src/constants/default_chapter.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/pages/bible/repositories/bible_repository.dart';
import 'package:pregue_a_palavra/src/services/app_settings.dart';

class BibleController extends ChangeNotifier {
  bool isLoading = false;

  final abbrevs = BooksBible.books.map((e) => e.abbrev.pt).toList();
  final chapters = BooksBible.books.map((e) => e.chapters).toList();

  final bibleRepository = BibleRepository();

  BibleController() {
    _initalGetData();
  }

  BibleModel bible = BibleModel.fromJson(DefaultChapter.genesis);

  AppSettings settings = AppSettings();

  String abbrev = 'gn';

  int chapter = 1;

  String version = 'nvi';

  _initalGetData() async {
    isLoading = true;
    bible = await settings.getChapter();
    abbrev = bible.book.abbrev.pt;
    chapter = bible.chapter.number;
    isLoading = false;
    notifyListeners();
  }

  Future<void> search() async {
    isLoading = true;
    bible = await bibleRepository.getData(abbrev, chapter, version);
    bible = bible.copyWith();
    isLoading = false;
    settings.saveChapter(bible);
    bibleRepository.save(bible);
    notifyListeners();
  }

  void setVersion(String newVersion) {
    version = newVersion;
    print(version);
    search();
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
    } else {
      previousBook();
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
    chapter = BooksBible.books.elementAt(index).chapters!;
    search();
    notifyListeners();
  }

  void selecionar(int index) {
    bible.verses[index].isSelected = !bible.verses[index].isSelected;
    bible = bible.copyWith();
    settings.saveChapter(bible);
    bibleRepository.save(bible);
    notifyListeners();
  }
}
