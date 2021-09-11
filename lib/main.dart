import 'package:flutter/material.dart';
import 'calender_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Calender.id,
      routes: {
        Calender.id:(context)=>Calender(),
      },
    );
  }
}
