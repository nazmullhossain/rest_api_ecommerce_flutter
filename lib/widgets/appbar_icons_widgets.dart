import 'package:flutter/material.dart';

class AppBarIconsWidgets extends StatelessWidget {
  AppBarIconsWidgets({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
