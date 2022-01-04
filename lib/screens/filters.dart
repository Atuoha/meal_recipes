import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/models/theme.dart';
import 'package:provider/provider.dart';
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

  static const style = TextStyle(fontSize: 18);

  void toggleCheck(value, type) {
    setState(
      () {
        switch (type) {
          case 'isVeganCheck':
            isVeganCheck = value;
            Provider.of<ThemeDataa>(context,listen:false).isVeganCheck = value;
            break;
          case 'isLactoseCheck':
            isLactoseCheck = value;
            Provider.of<ThemeDataa>(context,listen:false).isLactoseCheck = value;
            break;
          case 'isVegetarianCheck':
            isVegetarianCheck = value;
            Provider.of<ThemeDataa>(context,listen:false).isVegetarianCheck = value;
            break;
          default:
            isGlutenCheck = value;
            Provider.of<ThemeDataa>(context,listen:false).isGlutenCheck = value;
        }
      },
    );
  }

  DataRow buildDataRow(String text, bool value) {
    return DataRow(cells: [
      DataCell(
        Text(text, style: style),
      ),
      DataCell(
        Text(
          value.toString(),
          style: TextStyle(
            color: value ? Colors.green : Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ]);
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
              isCheck:  Provider.of<ThemeDataa>(context,listen:false).isGlutenCheck,
              type: 'isGlutenCheck',
              toggleCheck: toggleCheck,
            ),
            ListTileComponent(
              title: 'Lactose-Free',
              subtitle: 'Only include lactose-free meals',
              isCheck:  Provider.of<ThemeDataa>(context,listen:false).isLactoseCheck,
              type: 'isLactoseCheck',
              toggleCheck: toggleCheck,
            ),
            ListTileComponent(
              title: 'Vegetarain',
              subtitle: 'Only include vegatarian meals',
              isCheck:  Provider.of<ThemeDataa>(context,listen:false).isVegetarianCheck,
              type: 'isVegetarianCheck',
              toggleCheck: toggleCheck,
            ),
            ListTileComponent(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              isCheck:  Provider.of<ThemeDataa>(context,listen:false).isVeganCheck,
              type: 'isVeganCheck',
              toggleCheck: toggleCheck,
            ),
            DataTable(
              headingRowHeight: 37,
              headingRowColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.08);
                }
                return Theme.of(context).primaryColor;
              }),
              columns: const [
                DataColumn(
                  label: Text(
                    'Filter',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Data',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
              rows: [
                buildDataRow('Gluten',  Provider.of<ThemeDataa>(context,listen:false).isGlutenCheck),
                buildDataRow('Vegan',  Provider.of<ThemeDataa>(context,listen:false).isVeganCheck),
                buildDataRow('Lactose',  Provider.of<ThemeDataa>(context,listen:false).isLactoseCheck),
                buildDataRow('Vegetarian',  Provider.of<ThemeDataa>(context,listen:false).isVegetarianCheck),
              ],
            )
          ],
        ),
      ),
    );
  }
}
