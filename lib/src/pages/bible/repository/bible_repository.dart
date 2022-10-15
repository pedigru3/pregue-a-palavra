import 'package:pregue_a_palavra/src/constants/endpoints.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/services/http_manager.dart';

class BibleRepository {
  final HttpManager _httpmanager = HttpManagerBible();
  getverses(
    String abbrev,
    int chapter,
  ) async {
    final result = await _httpmanager.reqRequest(
      url: '${Endpoints.bibleBaseUrl}/verses/nvi/$abbrev/$chapter',
      method: HttpMethods.get,
    );
    if (result["verses"] != null) {
      return result;
    } else {
      print('erro ao buscar dados no servidor');
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
