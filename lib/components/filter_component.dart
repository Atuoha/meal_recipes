import 'package:flutter/material.dart';

class ListTileComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String type;
  final bool isCheck;
  final void Function(bool, String) toggleCheck;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ListTileComponent({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.isCheck,
    required this.toggleCheck,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
        ),
      ),
      subtitle: Text(subtitle),
      leading:  Icon(Icons.build_circle, color: Theme.of(context).primaryColor),
      trailing: Switch(
          activeTrackColor: Theme.of(context).primaryColor,
          inactiveThumbColor: Theme.of(context).primaryColor,
          value: isCheck,
          onChanged: (value) {
            toggleCheck(value, type);
          }),
    );
  }
}
