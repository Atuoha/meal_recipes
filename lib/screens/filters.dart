import 'package:flutter/material.dart';
import 'package:meal_app/components/filter_component.dart';

// ignore: use_key_in_widget_constructors
class FilterScreen extends StatefulWidget {
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isVeganCheck = false;
  bool isLactoseCheck = false;
  bool isVegetarianCheck = false;
  bool isGlutenCheck = false;

  void toggleCheck(value, type) {
    setState(
      () {
        if (type == 'isVeganCheck') {
          isVeganCheck = value;
        } else if (type == 'isLactoseCheck') {
          isLactoseCheck = value;
        } else if (type == 'isVegetarianCheck') {
          isVegetarianCheck = value;
        } else {
          isGlutenCheck = value;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => (null),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Center(
              child: Text(
                'Adjust your meal selection',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTileComponent(
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meals',
              isCheck: isGlutenCheck,
              type: 'isGlutenCheck',
              toggleCheck: toggleCheck,
            ),
            ListTileComponent(
              title: 'Lactose-Free',
              subtitle: 'Only include lactose-free meals',
              isCheck: isLactoseCheck,
              type: 'isLactoseCheck',
              toggleCheck: toggleCheck,
            ),
            ListTileComponent(
              title: 'Vegetarain',
              subtitle: 'Only include vegatarian meals',
              isCheck: isVegetarianCheck,
              type: 'isVegetarianCheck',
              toggleCheck: toggleCheck,
            ),
            ListTileComponent(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              isCheck: isVeganCheck,
              type: 'isVeganCheck',
              toggleCheck: toggleCheck,
            ),
          ],
        ),
      ),
    );
  }
}
