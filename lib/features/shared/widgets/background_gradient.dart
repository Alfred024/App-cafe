import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  final Radius? radius;

  const BackgroundGradient({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
        child: DecoratedBox(
      decoration: BoxDecoration(
          //borderRadius: (radius != null) ?? radius : BorderRadius.circular(20),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black87],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    ));
  }
}
