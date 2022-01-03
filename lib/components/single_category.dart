import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  final String title;
  final String id;
  final AssetImage image;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  SingleCategory({
    required this.title,
    required this.id,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/category-meals', arguments: {
          'id': id,
          'title': title,
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Container(
             decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
            child: Column(children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
