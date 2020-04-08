import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/widgets.dart';

import 'i18n.dart';

class I18nDelegate extends LocalizationsDelegate<I18n> {
  const I18nDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<I18n> load(Locale locale) {
    return SynchronousFuture<I18n>(I18n(locale));
  }

  @override
  bool shouldReload(I18nDelegate old) => false;
}
