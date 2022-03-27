import 'package:flutter/material.dart';
import 'package:tareas/ui/screens/home.dart';
import 'package:tareas/ui/screens/list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      routes: {
        '/home' : (context) => Home(),
        '/tasks' : (context) => ListItem()

      },
      home: Home(),
    );
  }
}
