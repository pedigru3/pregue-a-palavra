import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/repositories/bible_repository.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  final client = ClientMock();

  final repository = BibleRepository(client);

  test('deve trazer um BibleModel', () async {
    when(() => client.get(
          Uri.parse('https://www.abibliadigital.com.br/api/verses/nvi/sl/23'),
          headers: repository.headerBible,
        )).thenAnswer((_) async => http.Response(jsonData, 200));

    final BibleModel bible = await repository.fetchChapter();

    print(bible);
    expect(bible.chapter.verses, equals(6));
  });

  test('retornar exception se não for statuCode 200', () async {
    when(() => client.get(
          Uri.parse('https://www.abibliadigital.com.br/api/verses/nvi/sl/23'),
          headers: repository.headerBible,
        )).thenAnswer((_) async => http.Response(jsonData, 404));

    expect(() async => await repository.fetchChapter(), throwsException);
  });
}

String jsonData = '''
{
	"book": {
		"abbrev": {
			"pt": "sl",
			"en": "ps"
		},
		"name": "Salmos",
		"author": "David, Moisés, Salomão",
		"group": "Poéticos",
		"version": "nvi"
	},
	"chapter": {
		"number": 23,
		"verses": 6
	},
	"verses": [
		{
			"number": 1,
			"text": "O Senhor é o meu pastor; de nada terei falta."
		},
		{
			"number": 2,
			"text": "Em verdes pastagens me faz repousar e me conduz a águas tranqüilas;"
		},
		{
			"number": 3,
			"text": "restaura-me o vigor. Guia-me nas veredas da justiça por amor do seu nome."
		},
		{
			"number": 4,
			"text": "Mesmo quando eu andar por um vale de trevas e morte, não temerei perigo algum, pois tu estás comigo; a tua vara e o teu cajado me protegem."
		},
		{
			"number": 5,
			"text": "Preparas um banquete para mim à vista dos meus inimigos. Tu me honras, ungindo a minha cabeça com óleo e fazendo transbordar o meu cálice."
		},
		{
			"number": 6,
			"text": "Sei que a bondade e a fidelidade me acompanharão todos os dias da minha vida, e voltarei à casa do Senhor enquanto eu viver."
		}
	]
}
''';
