import 'package:flutter_test/flutter_test.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/pages/bible/controllers/bible_controller.dart';

void main() {
  BibleController controller = BibleController();
  test('printar algo', () async {
    BibleModel test = await controller.search('sl', 23);
    print(test);
  });
}
