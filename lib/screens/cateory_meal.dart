import 'package:flutter/material.dart';
import 'package:meal_app/components/single_category_meal_item.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/single_meal.dart';

// ignore: use_key_in_widget_constructors
class CategoryMeal extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  CategoryMeal(this.availableMeals);

  @override
  State<CategoryMeal> createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  late List<Meal> categoryMeals;
  String title = '';
  var isLoaded = false;

  @override
  void didChangeDependencies() {
    if (!isLoaded) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      title = routeArgs["title"] as String;
      final id = routeArgs["id"] as String;
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      isLoaded = true;
    }
    super.didChangeDependencies();
  }

  void removeItem(id) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    return Scaffold(
      // drawer: DrawerComponent(),
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.restaurant),
            onPressed: () => {},
          ),
        ],
      ),
      body: categoryMeals.isEmpty
          ? const Center(
              child: Text(
                'No meals to dispaly due to filters selected',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SingleMeal.routeName,
                      arguments: {
                        'id': categoryMeals[index].id,
                        'title': categoryMeals[index].title,
                      },
                    ).then((value) {
                      if (value != null) {
                        removeItem(value);
                      }
                    });
                  },
                  child: SingleCatCardItem(
                    title: categoryMeals[index].title,
                    time: '${categoryMeals[index].duration} Min',
                    cost: categoryMeals[index].costText,
                    complexity: categoryMeals[index].complexityText,
                    image: categoryMeals[index].image,
                  ),
                );
              },
            ),
    );
  }
}
