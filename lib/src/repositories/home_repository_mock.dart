import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pregue_a_palavra/src/repositories/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<Map<String, dynamic>> getJson() async {
    String json = await rootBundle.loadString('assets/data/data.json');
    Map<String, dynamic> data = jsonDecode(json);
    return data;
  }
}
