import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'single_category.dart';

class GridComponent extends StatelessWidget {
  List<Map<String, Object>> categories = [];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: Categories.map((category) {
          return SingleCategory(
            id: category.id,
            title: category.title,
            image: category.image,
          );
        }).toList());
  }
}
