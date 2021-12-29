// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/navigation_bar.dart';
import 'models/theme.dart';
import 'screens/cateory_meal.dart';
import 'screens/favorite_meals.dart';
import 'screens/single_meal.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeDataa(),
        lazy: true,
        child: MyApp(),
      ),
    );

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 toggleTheme(value) {
    setState(() {
      Provider.of<ThemeDataa>(context,listen:false).toggleDarkTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<ThemeDataa>(context, listen: false).darkTheme
            ? Colors.brown
            : Colors.purple,
        primaryColor: Provider.of<ThemeDataa>(context, listen: false).darkTheme
            ? Colors.brown
            : Colors.purple,
        fontFamily: 'Quicksand',
      ),
      home: NavigationBarComponent(toggleTheme: toggleTheme,),
      routes: {
        CategoryMeal.routeName: (context) => CategoryMeal(),
        SingleMeal.routeName: (context) => SingleMeal(),
        FavoriteMeals.routeName: (context) => FavoriteMeals(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoryMeal(),
        );
      },
    );
  }
}
