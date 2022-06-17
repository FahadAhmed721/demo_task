import 'package:demo_task/model/image_model.dart';
import 'package:demo_task/views/custom_helper/responsive.dart';
import 'package:demo_task/views/screens/game_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const GameScreen(title: 'Where is the Flutter?'),
      routes: {
        '/': (context) => const GameScreen(title: 'Where is the Flutter?'),
      },
    );
  }
}
