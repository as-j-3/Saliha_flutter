import 'package:excal_exampl/screens/ExcelHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excel Reader',
      theme: ThemeData(fontFamily: 'Cairo'),
      initialRoute: '/',
      routes: {
        '/': (context) => ExcelHome(),},
    );

  }
}

