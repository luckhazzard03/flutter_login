import 'package:flutte_tablechef/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core'; // Importación normal

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: 'Chef Table',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(body: Login('Code By Chance')),
    );
  }
}
