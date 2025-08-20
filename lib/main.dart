import 'package:authify_app/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Authify",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimatedLoginPage(),
    );
  }
}
