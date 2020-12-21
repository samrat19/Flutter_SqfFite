import 'package:flutter/material.dart';

class DesignedCircle extends StatelessWidget {
  final Color color;

  const DesignedCircle({Key key, @required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
