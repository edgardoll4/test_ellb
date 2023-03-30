import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double  size;
  final List<Color> colors;
  const Circle({super.key, required this.size, required this.colors})
    : assert(size>0),
    assert(colors != null && colors.length>=2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : this.size,
      height : this.size,
      decoration: BoxDecoration(
        // color: Colors.orange,
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: this.colors, begin: Alignment.topCenter, end: Alignment.bottomCenter)
      ),
    );
  }
}