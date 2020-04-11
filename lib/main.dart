import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:relaxing_sounds/screens/main.widget.dart';
import 'package:relaxing_sounds/style/main_colors.dart';
import 'i18n/i18n.dart';
import 'i18n/i18nDelegate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('pt'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: MainColors.appBarGradientStart,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: MainColors.appBarGradientStart,
      ),
      onGenerateTitle: (context) => I18n.of(context).translate('title'),
      home: MainWidget(),
    );
  }
}
