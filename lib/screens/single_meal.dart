import 'package:flutter/material.dart';

class SingleMeal extends StatelessWidget {
  static const routeName = '/single-meal';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final title = routeArgs["title"] as String;
    final id = routeArgs["id"] as String;

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: [
        IconButton(
          icon: const Icon(Icons.star_outline_outlined),
          onPressed: () => null,
        ),
      ]),
      body: Column(
        children: const [
          Expanded(
            flex: 1,
            child: Image(
              image: AssetImage('assets/imgs/vv.jpg'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text('Descriptions'),
          )
        ],
      ),
    );
  }
}
