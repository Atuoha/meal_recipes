// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:provider/provider.dart';
import 'components/navigation_bar.dart';
import 'models/dummy_data.dart';
import 'models/meal.dart';
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
  static const routeName = '/app';
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals = Meals;
  List<Meal> availableFavoriteMeals = favoriteMeals;

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };



  void setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;

      // available meals based on filters selected
      availableMeals = Meals.where((meal) {
        if (filters['gluten'] == true && !meal.isGluten) {
          return false;
        }
        if (filters['lactose'] == true && !meal.isLactose) {
          return false;
        }
        if (filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] == true && !meal.isVegatarian) {
          return false;
        }
        return true;
      }).toList();

      // available favorite meals based on filters selected
      availableFavoriteMeals = favoriteMeals.where((meal) {
        if (filters['gluten'] == true && !meal.isGluten) {
          return false;
        }
        if (filters['lactose'] == true && !meal.isLactose) {
          return false;
        }
        if (filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] == true && !meal.isVegatarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavoriteMeal(Meal meal, bool isFavorite) {
    switch (isFavorite) {
      case true:
        setState(() {
          availableFavoriteMeals.remove(meal);
        });
        break;
      case false:
        setState(() {
          availableFavoriteMeals.add(meal);
        });
        break;
      default:
    }
  }

  toggleTheme() {
    setState(() {
      Provider.of<ThemeDataa>(context, listen: false).toggleDarkTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeDataa>(context, listen: false).darkTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme
          ? ThemeData.dark().copyWith(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.black,
              ),
            )
          : ThemeData(
              primarySwatch: Colors.purple,
              primaryColor: Colors.purple,
              fontFamily: 'Quicksand',
            ),
      home: NavigationBarComponent(
          toggleTheme: toggleTheme, favoritemealList: availableFavoriteMeals,),
      routes: {
        MyApp.routeName: (context) => MyApp(),
        CategoryMeal.routeName: (context) => CategoryMeal(availableMeals),
        SingleMeal.routeName: (context) => SingleMeal(toggleFavoriteMeal,availableFavoriteMeals),
        FavoriteMeals.routeName: (context) =>
            FavoriteMeals(availableFavoriteMeals),
        FilterScreen.routeName: (context) => FilterScreen(setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoryMeal(availableMeals),
        );
      },
    );
  }
}
