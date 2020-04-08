import "package:flutter/widgets.dart";

class I18n {
  final Locale locale;

  I18n(this.locale) {
    languageCode = locale.languageCode;
  }

  static String languageCode = "";
  static I18n current;

  static Future<I18n> load(Locale locale) async {
    languageCode = locale.languageCode;
  }

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  String translate(String value) {
    return _values[languageCode][value];
  }

  static String getValue(String value) {
    return _values[languageCode][value];
  }

  static Map<String, Map<String, String>> _values = {
    "en": {
      "title": "Relaxing Sounds",
      "thunder_storm": "Thunder Storm",
      "forest": "Forest",
      "ligth_rain": "Ligth Rain",
      "ocean": "Ocean",
      "water": "Water",
      "waterfall": "WaterFall",
    },
    "pt": {
      "title": "Relaxing Sounds",
      "thunder_storm": "Tempestade",
      "forest": "Floresta",
      "ligth_rain": "Chuva Fraca",
      "ocean": "Oceano",
      "water": "Água",
      "waterfall": "Cachoeira",
    }
  };
}
