import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:relaxing_sounds/screens/soundsList.dart';
import 'package:relaxing_sounds/style/app_sizes.dart';
import 'package:relaxing_sounds/style/main_colors.dart';
import 'package:relaxing_sounds/widget/appBar.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSizes.loadAppSizes(context);
    return Scaffold(
      backgroundColor: MainColors.planetPageBackground,
      appBar: MainAppBar(),
      body: SoundsList(),
    );
  }
}
