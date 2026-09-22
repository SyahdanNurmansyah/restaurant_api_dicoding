import 'package:flutter/material.dart';

enum RestaurantColor {
  green("Green", Colors.green);

  final String name;
  final Color color;
  const RestaurantColor(this.name, this.color);
}
