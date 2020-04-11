import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/layout/layout.widget.dart';
import 'package:relaxing_sounds/style/main_colors.dart';

class About extends StatelessWidget {
  Future<String> _loadAsset() async {
    return await rootBundle.loadString('assets/about/about.md');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _loadAsset(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.hasData);
            return Layout(
              title: I18n.getValue("about"),
              child: Container(
                color: MainColors.aboutPageBackground,
                child: Markdown(
                  data: snapshot.data,
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
