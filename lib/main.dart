// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'screens/cateory_meal.dart';
import 'screens/home.dart';
import 'screens/single_meal.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
      ),
      home: HomePage(),
      routes: {
        CategoryMeal.routeName: (context) => CategoryMeal(),
        SingleMeal.routeName: (context) => SingleMeal()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoryMeal());
      },
    );
  }
}
