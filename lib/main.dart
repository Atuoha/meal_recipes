// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'components/bottom_navigationbar.dart';
import 'components/drawer.dart';

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
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBarComponent(),
        drawer: DrawerComponent(),
        appBar: AppBar(
          // centerTitle: true,
          title: const Text('Meal Categories'),
        ),
        body: const Center(
          child: Text('Body of Content'),
        ),
      ),
    );
  }
}
