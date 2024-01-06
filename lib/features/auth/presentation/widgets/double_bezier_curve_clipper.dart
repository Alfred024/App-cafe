import 'package:flutter/material.dart';

class DoubleBezierCurveClipper extends CustomClipper<Path> {
  final Size size;

  DoubleBezierCurveClipper({required this.size});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var p1 = Offset((size.width / 5), size.height);
    var p2 = Offset((size.width / 2), (size.height * 0.75));
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);

    var p3 = Offset((size.width / 10) * 8.5, size.height * 0.5);
    var p4 = Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(p3.dx, p3.dy, p4.dx, p4.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
