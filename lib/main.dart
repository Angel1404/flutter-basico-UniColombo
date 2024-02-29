import 'package:flutter/material.dart';
import 'package:flutter_basico_uni/ui/pages/home/views/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curso Basico Flutter',
      home: HomeView(),
    );
  }
}
