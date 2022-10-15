import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/constants/books_bible.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/pages/bible/repository/bible_repository.dart';

class WholeBibleController extends ChangeNotifier {
  final bibleRepository = BibleRepository();

  bool isLoading = false;

  //Aqui serão alocados todos os dados da bíblia
  Map<String, Map<int, BibleModel>> wholeBible = {};

  //verifica se já está alocado na memória
  bool _isAllocated(String abbrev, int chapter) {
    if (wholeBible.containsKey(abbrev)) {
      return wholeBible[abbrev]!.containsKey(chapter);
    } else {
      return false;
    }
  }

  Future<BibleModel> _search(String abbrev, int chapter) async {
    isLoading = true;
    Map<String, dynamic> map = await bibleRepository.getverses(abbrev, chapter);
    BibleModel bibleModel = BibleModel.fromJson(map);

    //Adiciona o BOOK para n retornar nulo
    final book = BooksBible.books.where((e) {
      final match = e.abbrev.pt;
      return match.contains(bibleModel.book.abbrev.pt);
    }).toList();
    //

    isLoading = false;
    notifyListeners();

    return bibleModel.copyWith(book: book.first);
  }

  void _addBible(BibleModel bibleModel) {
    wholeBible = {
      bibleModel.book.abbrev.pt: {
        bibleModel.chapter.number: bibleModel,
      }
    };
  }

  Future<BibleModel> getData(String abbrev, int chapter) async {
    if (_isAllocated(abbrev, chapter)) {
      final bibleModel = wholeBible[abbrev]![chapter]!;
      return bibleModel;
    } else {
      final bibleModel = await _search(abbrev, chapter);
      _addBible(bibleModel);
      return bibleModel;
    }
  }
}
