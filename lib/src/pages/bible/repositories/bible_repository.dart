import 'package:pregue_a_palavra/src/interfaces/local_storage_interface.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
import 'package:pregue_a_palavra/src/services/bible_remote_data.dart';
import 'package:pregue_a_palavra/src/services/shared_local_storage_service.dart';

class BibleRepository {
  final bibleRemoteData = BibleRemoteDataService();

  ILocalStorage localStorage = SharedLocalStorageService();

  Future<void> save(BibleModel bibleModel) async {
    var key = _generateKey(bibleModel);
    String bibleJson = bibleModelToJson(bibleModel);
    localStorage.put(key, bibleJson);
  }

  Future<BibleModel> getData(String abbrev, int chapter, String version) async {
    String key = '$version$abbrev$chapter';
    var data = await localStorage.get(key);
    if (data == null) {
      return await bibleRemoteData.getverses(abbrev, chapter, version);
    }
    return bibleModelFromJson(data);
  }

  String _generateKey(BibleModel bibleModel) {
    String abbrev = bibleModel.book.abbrev.pt;
    String chapter = bibleModel.chapter.number.toString();
    String version = bibleModel.book.version!;
    return '$version$abbrev$chapter';
  }
}
