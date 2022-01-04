import 'package:flutter/material.dart';
import 'package:meal_app/components/single_category_meal_item.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/single_meal.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class FavoriteMeals extends StatefulWidget {
  List<Meal> favoriteMealList;
  // ignore: use_key_in_widget_constructors
  FavoriteMeals(this.favoriteMealList);
  static const routeName = '/favorite-meals';

  @override
  State<FavoriteMeals> createState() => _FavoriteMealsState();
}

class _FavoriteMealsState extends State<FavoriteMeals> {
  // late List<Meal> widget.favoriteMealList = favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return widget.favoriteMealList.isEmpty
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
            itemCount: widget.favoriteMealList.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    SingleMeal.routeName,
                    arguments: {
                      'id': widget.favoriteMealList[index].id,
                      'title': widget.favoriteMealList[index].title,
                    },
                  ).then((value) {
                    setState(() {
                      widget.favoriteMealList = widget.favoriteMealList;
                    });
                  });
                },
                child: SingleCatCardItem(
                  title: widget.favoriteMealList[index].title,
                  time: '${widget.favoriteMealList[index].duration} Min',
                  cost: widget.favoriteMealList[index].costText,
                  complexity: widget.favoriteMealList[index].complexityText,
                  image: widget.favoriteMealList[index].image,
                ),
              );
            },
          );
  }
}
