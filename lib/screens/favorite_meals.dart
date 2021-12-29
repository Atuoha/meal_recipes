import 'package:flutter/material.dart';
import 'package:meal_app/components/single_category_meal_item.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/screens/single_meal.dart';

// ignore: use_key_in_widget_constructors
class FavoriteMeals extends StatelessWidget {
  static const routeName = '/favorite-meals';

  @override
  Widget build(BuildContext context) {
    final favoriteMealList = favoriteMeals;

    return favoriteMealList.isEmpty
        ? const Center(
            child: Text(
              'No Favorite Meals Added',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemCount: favoriteMealList.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    SingleMeal.routeName,
                    arguments: {
                      'id': favoriteMealList[index].id,
                      'title': favoriteMealList[index].title,
                    },
                  );
                },
                child: SingleCatCardItem(
                  title: favoriteMealList[index].title,
                  time: '${favoriteMealList[index].duration} Min',
                  cost: favoriteMealList[index].costText,
                  complexity: favoriteMealList[index].complexityText,
                  image: favoriteMealList[index].image,
                ),
              );
            },
          );
  }
}
