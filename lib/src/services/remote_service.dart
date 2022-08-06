import 'package:pregue_a_palavra/src/models/item_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<ItemModel>?> getItens() async {
    var client = http.Client();

    Uri uri = Uri.parse("https://ipitest.pedigru3.repl.co/pegarlivros");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return itemModelFromJson(json);
    }
  }
}
