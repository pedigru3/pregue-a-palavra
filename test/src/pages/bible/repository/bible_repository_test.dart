import 'package:flutter_test/flutter_test.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/pages/bible/repository/bible_repository.dart';

void main() {
  BibleRepository bible = BibleRepository();
  test('deve funcionar', () async {
    final json = await bible.getverses('sl', 23);
    final result = BibleModel.fromJson(json);
    expect(result.verses.length, 6);
  });

  test('deve retornar todos os livros', () async {
    final json = await bible.getbooks();
    expect(json[0].chapters, 50);
  });
}
