import 'package:flutter/material.dart';
import 'package:meal_app/components/bottom_navigationbar.dart';
import 'package:meal_app/components/category_grid_view.dart';
import 'package:meal_app/components/drawer_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarComponent(),
      drawer: DrawerComponent(),
      appBar: AppBar(title: const Text('Meal and Recipes'), actions: const [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.restaurant),
        )
      ]),
      body: GridComponent(),
    );
  }
}
