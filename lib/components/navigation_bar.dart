// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meal_app/models/theme.dart';
import 'package:meal_app/screens/favorite_meals.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/home.dart';
import 'package:provider/provider.dart';
import 'drawer_component.dart';

// ignore: use_key_in_widget_constructors
class NavigationBarComponent extends StatelessWidget {
  final void Function() toggleTheme;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  NavigationBarComponent({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeDataa>(context, listen: false).darkTheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.black54,
        drawer: DrawerComponent(),
        appBar: AppBar(
          title: const Text('Meal and Recipes'),
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(FilterScreen.routeName),
              },
              icon: const Icon(Icons.restaurant),
            ),
            IconButton(
              icon: theme
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
              onPressed: toggleTheme,
              splashRadius: 4400,
            ),
            // Switch(
            //   activeColor: Colors.black,
            //   value: Provider.of<ThemeDataa>(context,listen:false).darkTheme,
            //   onChanged: (value) {
            //     toggleTheme();
            //   },
            // ),
          ],
          bottom: TabBar(
            indicatorColor: theme ? Colors.redAccent[200] : Colors.yellow,
            labelColor: theme ? Colors.redAccent[200] : Colors.yellow,
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(icon: Icon(Icons.category), text: 'Category'),
              Tab(icon: Icon(Icons.star), text: 'Favorities'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const HomePage(),
            FavoriteMeals(),
          ],
        ),
      ),
    );
  }
}



// BOTTOM NAVIGATION --WORKING PERFECTLY

// import 'package:flutter/material.dart';
// import 'package:meal_app/screens/favorite_meals.dart';
// import 'package:meal_app/screens/home.dart';
// import 'drawer_component.dart';

// // ignore: use_key_in_widget_constructors
// class NavigationBarComponent extends StatefulWidget {
//   @override
//   State<NavigationBarComponent> createState() => _NavigationBarComponentState();
// }

// class _NavigationBarComponentState extends State<NavigationBarComponent> {

//     final List<Widget> _pages = [const HomePage(), FavoriteMeals()];
//     int _selectedPageIndex = 0;
//     void _selectPage(int index) {
//       setState(() {
//         _selectedPageIndex = index;
//       });
//     }


//   @override
//   Widget build(BuildContext context) {
  
//     return Scaffold(
//         drawer: DrawerComponent(),
//         appBar: AppBar(
//           title: _selectedPageIndex == 0
//               ? const Text('Meal and Recipies')
//               : const Text('Favorities'),
//           actions: const [
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(Icons.restaurant),
//             )
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: _selectPage,
//           elevation: 5,
//           backgroundColor: Colors.purple,
//           selectedItemColor: Colors.yellow[900],
//           unselectedItemColor: Colors.white,
//           currentIndex: _selectedPageIndex,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
//           ],
//         ),
//         body: _pages[_selectedPageIndex]);
//   }
// }







// 5092273599:AAFHjbabT1f88vK6i1Gm8AAjPi_pAsRXhCA
// BOT token