import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'i18n/i18nDelegate.dart';
import 'layout/layout.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('pt'),
      ],
      title: "Relaxing Sounds",
      home: Layout(),
    );
  }
}
