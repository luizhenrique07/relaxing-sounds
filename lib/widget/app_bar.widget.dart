import 'package:flutter/material.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/screens/about.widget.dart';
import 'package:relaxing_sounds/style/main_colors.dart';

class MainAppBar extends AppBar {
  final String titleText;
  final bool isMainPage;
  final BuildContext context;

  MainAppBar({@required this.titleText, this.isMainPage = false, this.context})
      : super(
          centerTitle: true,
          backgroundColor: MainColors.appBarGradientStart,
          title: Text(
            titleText,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Roboto-Black",
            ),
          ),
          elevation: 0.0,
          actions: isMainPage
              ? <Widget>[
                  PopupMenuButton<String>(
                    onSelected: (selectedChoice) {
                      if (selectedChoice == I18n.getValue('about')) {
                        print("sobre");
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                            return About();
                          }),
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [I18n.getValue('about')].map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  )
                ]
              : <Widget>[],
        );
}
