import 'package:flutter/cupertino.dart';
import 'package:relaxing_sounds/i18n/i18n.dart';
import 'package:relaxing_sounds/layout/layout.widget.dart';
import 'package:relaxing_sounds/screens/soundsListView.widget.dart';
import 'package:relaxing_sounds/store/main_store.dart';

class MainWidget extends StatelessWidget {
  final store = MainStore();

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: SoundsListView(
        store: store,
      ),
      title: I18n.getValue('title'),
      context: context,
    );
  }
}
