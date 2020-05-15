import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
      child: MaterialApp(
        home: HomePageWidget(),
      ),
    );
  }
}
