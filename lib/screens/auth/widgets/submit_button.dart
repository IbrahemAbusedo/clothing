import 'package:flutter/material.dart';
import '../../../constants.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.text,
    this.background = const Color(ColorManager.mainColor),
    this.color = const Color(0xffffffff),
    required this.onPressed,
  });
  final String text;
  final Color background;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: background,
          minimumSize: const Size(205, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(133),
          )),
      onPressed: onPressed,
      // _pageController.nextPage(
      // duration: const Duration(seconds: 1),
      // curve: Curves.easeInOutQuad);
      //
      child: Text(text,style:TextStyle(
        color: color,
      ),),
    );
  }
}