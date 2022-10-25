import 'package:pregue_a_palavra/src/constants/books_bible.dart';
import 'package:pregue_a_palavra/src/constants/endpoints.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/services/http_manager.dart';

class BibleRemoteDataService {
  final HttpManager _httpmanager = HttpManagerBible();

  Future getverses(
    String abbrev,
    int chapter,
  ) async {
    final result = await _httpmanager.reqRequest(
      url: '${Endpoints.bibleBaseUrl}/verses/nvi/$abbrev/$chapter',
      method: HttpMethods.get,
    );
    if (result["verses"] != null) {
      var bibleModel = BibleModel.fromJson(result);
      //Adiciona o BOOK para n retornar nulo
      final books = BooksBible.books.where((e) {
        final match = e.abbrev.pt;
        return match.contains(bibleModel.book.abbrev.pt);
      }).toList();
      return bibleModel.copyWith(book: books.first);
    } else {
      throw Exception('Erro ao buscar dados no servidor');
    }
  }

  Future<List<Book>> getbooks() async {
    final result = await _httpmanager.reqRequest(
      url: '${Endpoints.bibleBaseUrl}/books',
      method: HttpMethods.get,
    );
    if (result['result'] != null) {
      return bookModelFromList(result["result"]);
    } else {
      return [];
    }
  }
}
