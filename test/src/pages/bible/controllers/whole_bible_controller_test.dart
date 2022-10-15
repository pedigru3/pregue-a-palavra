import 'package:flutter_test/flutter_test.dart';
import 'package:pregue_a_palavra/src/pages/bible/controllers/whole_bible_controller.dart';

void main() {
  WholeBibleController controller = WholeBibleController();

  test('deve retornar sem erro', () async {
    print(controller.wholeBible);
    await controller.getData('gn', 1);
    print(controller.wholeBible);
    controller.getData('gn', 2);
    print(controller.isLoading);
  });
}
