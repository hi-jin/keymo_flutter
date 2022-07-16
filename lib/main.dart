import 'package:flutter/material.dart';
import 'package:keymo_flutter/view/home/add_keyword_view.dart';
import 'package:keymo_flutter/view/home/home_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
        ),
      ),
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => const HomeView(),
        AddKeywordView.id: (context) => const AddKeywordView(),
      },
    );
  }
}
