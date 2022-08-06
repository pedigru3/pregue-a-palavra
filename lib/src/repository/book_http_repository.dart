import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pregue_a_palavra/src/models/book_model.dart';

class BookHttpRepository {
  Future<List<BookModel>> findAllBooks() async {
    final response = await http
        .get(Uri.parse('https://www.abibliadigital.com.br/api/books'));
    final List<Map<String, dynamic>> responseMap = jsonDecode(response.body);
    return responseMap
        .map<BookModel>((resp) => BookModel.fromJson(resp))
        .toList();
  }
}
