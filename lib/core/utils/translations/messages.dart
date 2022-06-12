import 'package:get/get.dart';
import 'translations_en.dart';
import 'translations_es.dart';

/// *@
class Literals extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": TranslationsEn.values,
        "es": TranslationsEs.values,
      };
}
