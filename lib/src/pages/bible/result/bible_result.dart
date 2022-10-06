import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pregue_a_palavra/src/models/bible_model.dart';
part 'bible_result.freezed.dart';

class BibleResult with _$BibleResult {
  factory BibleResult.success(BibleModel bible) = Success;
  factory BibleResult.error(String msg) = Error;
}
