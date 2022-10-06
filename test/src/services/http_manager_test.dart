import 'package:flutter_test/flutter_test.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/services/http_manager.dart';

void main() {
  HttpManager bibleRequest = HttpManagerBible();
  const String url = 'https://www.abibliadigital.com.br/api/verses/nvi/sl/23';

  test('retorna abreviação correta', () async {
    Map<String, dynamic> mapa =
        await bibleRequest.reqRequest(url: url, method: HttpMethods.get);
    BibleModel bible = BibleModel.fromJson(mapa);
    expect(bible.book.abbrev.pt, 'sl');
    expect(bible.verses.length, 6);
  });
}
