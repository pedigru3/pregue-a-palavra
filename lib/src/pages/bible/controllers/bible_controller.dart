import 'package:flutter/foundation.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/pages/bible/repository/bible_repository.dart';

class BibleController extends ChangeNotifier {
  bool isLoading = false;

  final bibleRepository = BibleRepository();

  BibleModel? bible;
  String book = 'gn';
  int chapter = 1;

  Future<void> search() async {
    print('pegando no servidor');
    isLoading = true;
    Map<String, dynamic> map = await bibleRepository.getverses(book, chapter);
    isLoading = false;
    BibleModel result = BibleModel.fromJson(map);
    bible = result;
    notifyListeners();
  }
}
