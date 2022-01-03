import 'package:flutter/material.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:provider/provider.dart';
import '../models/theme.dart';


// ignore: use_key_in_widget_constructors
class DrawerComponent extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, String name) {
      return ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400
          ),
        ),
        leading: Icon(icon, color: Theme.of(context).primaryColor, size: 20),
        onTap: () {
          Navigator.pushNamed(
            context,
           name,

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
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Meal and Recipes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
                    ? const AssetImage('assets/imgs/z.jpeg')
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
          buildListTile(
            'Home',
            Icons.home,
            MyApp.routeName,
          ),
          buildListTile(
            'Filter Settings',
            Icons.settings,
            FilterScreen.routeName,
          ),
        ],
      ),
    );
  }
}
