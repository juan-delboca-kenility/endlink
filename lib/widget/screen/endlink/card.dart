import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double padding;
  final double radius;

  CustomCard({required this.child, super.key, required this.padding, this.radius = 3.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0, // Adjust the elevation as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius), // Adjust the radius as needed
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
