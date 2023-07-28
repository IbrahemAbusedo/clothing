import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
   const Indicator({
    Key? key,
    required this.isVisible,
    required this.color,
  }) : super(key: key);
  final bool isVisible;
  final Color? color;
  @override

  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: isVisible,
      child: SizedBox(
        width: 8,
        child: Icon(
          Icons.arrow_forward_ios,
          size: 15,
          color: color,
        ),
      ),
    );
  }
}