import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';
import 'package:relaxing_sounds/style/main_colors.dart';
import 'package:relaxing_sounds/widget/appBar.widget.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final String title;

  const Layout({Key key, this.child, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.loadAppSizes(context);
    return Scaffold(
      backgroundColor: MainColors.soundPageBackground,
      appBar: MainAppBar(
        titleText: title,
      ),
      body: child,
    );
  }
}
