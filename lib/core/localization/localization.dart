import 'package:get/get.dart';

import 'arabic.dart';
import 'english.dart';

class Locaization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arabicLanguage,
        'en': englishLanguage,
      };
}
