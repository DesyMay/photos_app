import 'package:flutter/material.dart';
import 'package:get/get.dart' show GetMaterialApp;
import 'package:photos_app/features/home/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photos App',
      home: HomeScreen(),
    );
  }
}
