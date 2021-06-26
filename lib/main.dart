import 'package:bugetapp_ui_design/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget UI design',
      theme: ThemeData(primaryColor: Colors.red.shade400),
      home: HomeScreen(),
    );
  }
}
