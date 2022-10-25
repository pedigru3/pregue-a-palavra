import 'package:pregue_a_palavra/src/constants/default_chapter.dart';
import 'package:pregue_a_palavra/src/interfaces/local_storage_interface.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/services/shared_local_storage_service.dart';

class AppSettings {
  ILocalStorage localStorage = SharedLocalStorageService();

  BibleModel defaultChapter = BibleModel.fromJson(DefaultChapter.genesis);

  Future<void> saveChapter(BibleModel bibleModel) async {
    String bibleJson = bibleModelToJson(bibleModel);
    await localStorage.put('bibleJson', bibleJson);
  }

  Future<BibleModel> getChapter() async {
    final data =
        await localStorage.get('bibleJson') ?? bibleModelToJson(defaultChapter);
    return bibleModelFromJson(data);
  }
}
