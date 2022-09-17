import 'dart:convert';

import 'package:http/http.dart';

import 'package:pregue_a_palavra/src/models/bible_model.dart';

class BibleRepository {
  final Client client;

  Map<String,String>? headerBible = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IlRodSBTZXAgMTUgMjAyMiAxOToxMDoxMSBHTVQrMDAwMC5mZXJyZWlyYS5jb250YXRvMUBnbWFpbC5jb20iLCJpYXQiOjE2NjMyNjkwMTF9._E-zPYgk4_y3s5NNWtvnzAbgJ-nz_7zTgEpJy5hHt1o'
  };

  BibleRepository(this.client);

  Future<BibleModel> fetchChapter() async {
    final response = await client.get(
      Uri.parse('https://www.abibliadigital.com.br/api/verses/nvi/sl/23'),
      headers: headerBible,
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return BibleModel.fromJson(json);
    } else {
      throw Exception('Erro na internet');
    }
  }
}
