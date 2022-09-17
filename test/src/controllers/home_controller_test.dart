import 'package:flutter_test/flutter_test.dart';
import 'package:pregue_a_palavra/src/controllers/bible_controller.dart';

void main() {
  final controller = BibleController();

  test('deve preencher variavel bible', () async {
    expect(controller.state, BibleState.start);
    await controller.start();
    expect(controller.state, BibleState.sucess);
  });
}
