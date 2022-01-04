import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class SingleMeal extends StatefulWidget {
  static const routeName = '/single-meal';
  List<Meal> availableFavoriteMeal;
  void Function(Meal, bool) toggleFavoriteMeal;
  // ignore: use_key_in_widget_constructors
  SingleMeal(this.toggleFavoriteMeal, this.availableFavoriteMeal);
  @override
  State<SingleMeal> createState() => _SingleMealState();
}

class _SingleMealState extends State<SingleMeal> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final title = routeArgs["title"] as String;
    final id = routeArgs["id"] as String;
    final selectedSingleMeal = Meals.firstWhere((selected) {
      return selected.id == id;
    });

    final isFavorite =
        widget.availableFavoriteMeal.any((favMeal) => favMeal.id == id);

    showImageModal(context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: NetworkImage(selectedSingleMeal.image),
                ),
              ),
            ),
          );
        },
      );
    }

    // void toggleFavoriteMeal(Meal meal) {
    //   switch (isFavorite) {
    //     case true:
    //       setState(() {
    //         favoriteMeals.remove(meal);
    //       });
    //       break;
    //     case false:
    //       setState(() {
    //         favoriteMeals.add(meal);
    //       });
    //       break;

    //     default:
    //   }
    // }

    Widget buildContainer(Widget child) {
      return Container(
        width: 300,
        height: 200,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2.0,
            color: Theme.of(context).primaryColor,
            style: BorderStyle.solid,
          ),
        ),
        child: child,
      );
    }

    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.delete_forever),
          onPressed: () {
            Navigator.of(context).pop(id);
          }),
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: isFavorite
                ? const Icon(Icons.star, color: Colors.orange)
                : const Icon(Icons.star_outline_outlined, color: Colors.white),
            onPressed: () =>
                widget.toggleFavoriteMeal(selectedSingleMeal, isFavorite),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                showImageModal(context);
              },
              child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(selectedSingleMeal.image),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'INGREDIENTS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    buildContainer(
                      ListView.builder(
                        itemCount: selectedSingleMeal.ingredients.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Theme.of(context).primaryColor,
                            elevation: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                selectedSingleMeal.ingredients[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Text(
                      'PREPARATION STEPS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    buildContainer(
                      ListView.builder(
                        itemCount: selectedSingleMeal.steps.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text('#${index + 1}'),
                                ),
                                title: Text(selectedSingleMeal.steps[index]),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
