import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/repositories/bible_repository.dart';
import 'package:http/http.dart';

class BibleController {
  late BibleModel bible;
  final repository = BibleRepository(Client());
  BibleState state = BibleState.start;

  Future start() async {
    state = BibleState.loading;
    try {
      bible = await repository.fetchChapter();
      state = BibleState.sucess;
    } catch (erro) {
      state = BibleState.error;
      throw Exception('Erro ao carregar repositório: $erro');
    }
  }
}

enum BibleState { start, loading, sucess, error }
