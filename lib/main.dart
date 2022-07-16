import 'package:flutter/material.dart';
import 'package:keymo_flutter/view/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
        ),
      ),
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => HomeView(),
      },
    );
  }
}
