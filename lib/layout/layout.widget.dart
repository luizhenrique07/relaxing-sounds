import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';
import 'package:relaxing_sounds/style/main_colors.dart';
import 'package:relaxing_sounds/widget/app_bar.widget.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final String title;
  final BuildContext context;

  const Layout(
      {Key key, @required this.child, @required this.title, this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.loadAppSizes(context);
    return Scaffold(
      backgroundColor: MainColors.soundPageBackground,
      appBar: MainAppBar(
        isMainPage: title == I18n.getValue('title'),
        titleText: title,
        context: context,
      ),
      body: child,
    );
  }
}
