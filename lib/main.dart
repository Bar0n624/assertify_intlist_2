
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'int_data.dart';
import 'home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Integer list provider',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage()
      ),
    );
  }
}