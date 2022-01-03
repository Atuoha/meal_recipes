
import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import '../components/filter_component.dart';

// ignore: use_key_in_widget_constructors
class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  FilterScreen(this.setFilters);

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
        switch (type) {
          case 'isVeganCheck':
            isVeganCheck = value;
            break;
          case 'isLactoseCheck':
            isLactoseCheck = value;
            break;
          case 'isVegetarianCheck':
            isVegetarianCheck = value;
            break;
          default:
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
            );
          },
        ),
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                widget.setFilters(
                  {
                    'gluten': isGlutenCheck,
                    'lactose': isLactoseCheck,
                    'vegan': isVeganCheck,
                    'vegetarian': isVegetarianCheck,
                  },
                );
                Navigator.of(context).pop();
              }),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder(
                  top: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                children:  const [
                  TableRow(
                    children: [
                      Text('Filter'),
                      Text('Data'),
                 
                    ],
                  ),

                   TableRow(
                    children: [
                      Text('Filter'),
                      Text('Data'),
                 
                    ],
                  ),
                  
                ],
              ),


            )
          ],
        ),
      ),
    );
  }
}
