import 'dart:math';

import 'package:flutter/material.dart';

class TiltCliper extends CustomClipper<Path> {
  const TiltCliper({
    this.topLeft = const Offset(0, 0),
    this.topRight = const Offset(0, 0),
    this.bottomLeft = const Offset(0, 0),
    this.bottomRight = const Offset(0, 0),
  });

  final Offset topLeft;
  final Offset topRight;
  final Offset bottomLeft;
  final Offset bottomRight;

  @override
  Path getClip(Size size) {
    final path = Path();
    final x1 = topLeft.dx;
    final y1 = topLeft.dy;
    final x2 = size.width + topRight.dx;
    final y2 = topRight.dy;
    final x3 = size.width + bottomRight.dx;
    final y3 = size.height + bottomRight.dy;
    final x4 = bottomLeft.dx;
    final y4 = size.height + bottomLeft.dy;

    path.moveTo(x1, y1);
    path.lineTo(x2, y2);
    path.lineTo(x3, y3);
    path.lineTo(x4, y4);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}