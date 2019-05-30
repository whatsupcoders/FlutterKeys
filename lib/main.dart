import 'package:flutter/material.dart';
import 'MyWordPage.dart';
import 'MyListPage.dart';
import 'MyFormPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff9e58b1),
      ),
      //home: MyWordPage(),
      home: MyFormPage(),
      //home:MyListPage()
    );
  }
}
