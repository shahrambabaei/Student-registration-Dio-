import 'package:flutter/material.dart';
import 'package:test_http/view/expert_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(elevation: 0),
          colorScheme: const ColorScheme.light(
              secondary: Color(0xff09CDA6), onSecondary: Colors.white),
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.blue.withOpacity(.1),
              labelStyle: const TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5))),
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
              subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w300))),
      home: const ExpertScreen(),
    );
  }
}
