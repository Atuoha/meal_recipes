import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters.dart';

import 'category_grid_view.dart';

// ignore: use_key_in_widget_constructors
class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0E3311).withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                ),
              ),
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.restaurant,
                        size: 45,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Meal and Recipe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage('assets/imgs/vv.jpg'),
                colorFilter: ColorFilter.mode(
                    const Color(0xFF0E3311).withOpacity(0.9),
                    BlendMode.dstATop),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(120),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Meals',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            leading: const Icon(
              Icons.restaurant,
              color: Colors.purple,
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => GridComponent()));
            },
          ),
          ListTile(
            title: const Text(
              'Filters',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            leading: const Icon(
              Icons.settings,
              color: Colors.purple,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Favorites',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            leading: const Icon(
              Icons.star,
              color: Colors.purple,
            ),
            onTap: () {
              print('ellll');
            },
          ),
        ],
      ),
    );
  }
}
