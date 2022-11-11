import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
    this.size = 30,
    this.color = Colors.white,
  }) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SpinKitChasingDots(
        color: color,
        size: size,
      ),
    );
  }
}
