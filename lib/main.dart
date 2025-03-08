import 'package:flutter/material.dart';
import 'package:shoes_app/HomePage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
              primary: const Color.fromARGB(255, 255, 185, 81),
              seedColor: Colors.orange),
          useMaterial3: true,
          textTheme: TextTheme(
            titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.black))),
      home: HomePage(),
    );
  }
}
