import 'package:flutter/material.dart';

class Shoe {
  final String name;
  final String imagePath;
  final String description;
  final String price;
  final bool inCart;
  Shoe(
      {required this.name,
      required this.imagePath,
      required this.description,
      required this.price,
      required this.inCart});
}
