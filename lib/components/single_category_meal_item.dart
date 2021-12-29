// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SingleCatCardItem extends StatelessWidget {
  final String title;
  final String time;
  final String cost;
  final String complexity;
  final String image;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  SingleCatCardItem({
    required this.image,
    required this.title,
    required this.time,
    required this.cost,
    required this.complexity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.5),
                ),
                width: 300,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ]),
            Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Row(children: [
                Icon(
                  Icons.access_alarm,
                ),
                SizedBox(width: 5),
                Text(time, style: TextStyle(fontSize: 17))
              ]),
              Row(children: [
                Icon(
                  Icons.work,
                ),
                SizedBox(width: 5),
                Text(complexity, style: TextStyle(fontSize: 17))
              ]),
              Row(children: [
                Icon(
                  Icons.attach_money,
                ),
                Text(cost, style: TextStyle(fontSize: 17))
              ]),
            ]))
        ],
      ),
      
    );
  }
}
