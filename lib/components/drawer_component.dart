import 'package:flutter/material.dart';
import 'package:meal_app/screens/favorite_meals.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/home.dart';
import 'package:provider/provider.dart';
import '../models/theme.dart';

import 'navigation_bar.dart';

// ignore: use_key_in_widget_constructors
class DrawerComponent extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    toggleTheme(value) {
      Provider.of<ThemeDataa>(context,listen:false).toggleDarkTheme();
  }

    Widget buildListTile(String title, IconData icon, Widget widget) {
      return ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        leading: Icon(icon, color: Theme.of(context).primaryColor, size: 26),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ),

            // when using BottomNavigation change the Widget to HomePage()
          );
        },
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.restaurant,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Meal and Recipes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Provider.of<ThemeDataa>(context,listen:false).darkTheme
                    ? const AssetImage('assets/imgs/f.jpg')
                    : const AssetImage('assets/imgs/vv.jpg'),
                colorFilter: ColorFilter.mode(
                    const Color(0xFF0E3311).withOpacity(0.9),
                    BlendMode.dstATop),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(120),
              ),
            ),
          ),
          // buildListTile(
          //   'Meals',
          //   Icons.restaurant,
          //   NavigationBarComponent(toggleTheme: toggleTheme,),
          // ),
          buildListTile(
            'Filters',
            Icons.settings,
            FilterScreen(),
          ),
        ],
      ),
    );
  }
}
