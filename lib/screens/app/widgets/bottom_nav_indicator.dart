import 'package:clothing/constants.dart';
import 'package:flutter/material.dart';
class BottomNavIndicator extends StatelessWidget {
  const BottomNavIndicator({
    super.key,
    required this.isVisible,
  });

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainAnimation: true,
      maintainState: true,
      maintainSize: true,
      visible: isVisible,
      child: Container(
        margin: EdgeInsets.only(bottom: 3),
        width: 13,
        height: 7,
        decoration: const BoxDecoration(
            color: Color(ColorManager.mainColor),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7))),
      ),
    );
  }
}