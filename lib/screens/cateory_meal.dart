import 'package:flutter/material.dart';
import 'package:meal_app/components/single_category_meal_item.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/screens/single_meal.dart';

class CategoryMeal extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs["title"] as String;
    final id = routeArgs["id"] as String;
    final categoryMeals = Meals.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      // drawer: DrawerComponent(),
      appBar: AppBar(title: Text(title), actions: [
        IconButton(
          icon: const Icon(Icons.restaurant),
          onPressed: () => {},
        ),
      ]),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.pushNamed(context, SingleMeal.routeName, arguments: {
                  'id': categoryMeals[index].id,
                  'title': categoryMeals[index].title,
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
          }),
    );
  }
}
