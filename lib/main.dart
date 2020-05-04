import 'package:applivrosbloc/screens/android/home/home_page.dart';
import 'package:applivrosbloc/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Livros',
      theme: appThemeData,
      home: Home(),
    );
  }
}
