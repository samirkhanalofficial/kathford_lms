import 'package:kathford/languages/english.language.dart';

class Language {
  String appName;
  Language({
    required this.appName,
  });
}

Language localization() {
  return english;
}
