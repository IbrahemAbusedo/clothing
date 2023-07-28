import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class RichTexts extends StatelessWidget {
  const RichTexts({
    super.key,
    required this.question,
    required this.answer,
    required this.onPressed,
    // required this.top,
    // required this.bottom,
  });
final String question;
final String answer;
final Function() onPressed;
  // final double top;
  // final double bottom;
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
        text: TextSpan(
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          ),
          children: <InlineSpan>[
            TextSpan(text:question,style: const TextStyle(
              color: Colors.black38,
            ), ),
            TextSpan(
              text:answer,
              recognizer: TapGestureRecognizer()..onTap= onPressed,
            ),
          ],
        ));
  }
}