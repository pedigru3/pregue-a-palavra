import 'package:get/get.dart';
import 'package:pregue_a_palavra/src/pages/bible/repository/bible_repository.dart';

class BibleController extends GetxController {
  RxBool isLoading = false.obs;

  final bibleRepository = BibleRepository();

  Future search(String abbrev, int chapter) async {
    isLoading.value = true;
    await bibleRepository.getverses(abbrev, chapter);
    isLoading.value = false;
  }
}
