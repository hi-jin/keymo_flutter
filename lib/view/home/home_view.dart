import 'package:flutter/material.dart';
import 'package:keymo_flutter/view/component/my_appbar.dart';
import 'package:keymo_flutter/view/home/add_keyword_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddKeywordView.id);
        },
      ),
    );
  }
}
