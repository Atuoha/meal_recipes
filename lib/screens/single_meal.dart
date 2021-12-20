import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_data.dart';

class SingleMeal extends StatelessWidget {
  static const routeName = '/single-meal';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final title = routeArgs["title"] as String;
    final id = routeArgs["id"] as String;
    final selectedSingleMeal = Meals.firstWhere((selected) {
      return selected.id == id;
    });

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
              color: Colors.purple,
              style: BorderStyle.solid,
            ),
          ),
          child: child);
    }

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: [
        IconButton(
          icon: const Icon(Icons.star_outline_outlined),
          onPressed: () => null,
        ),
      ]),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image(
              width: double.infinity,
              fit: BoxFit.cover,
              image: NetworkImage(selectedSingleMeal.image),
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
                                color: Colors.purple,
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
                            }),
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
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text('#${index + 1}'),
                                ),
                                title: Text(selectedSingleMeal.steps[index])
                              );
                            }),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
