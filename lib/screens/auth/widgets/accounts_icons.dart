import 'package:flutter/material.dart';

import '../../../constants.dart';
class AccountsIcons extends StatelessWidget {
  const AccountsIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          height: 70,
          width: 70,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              ImageManager.facebookImage,
              cacheHeight: 31,
              cacheWidth: 31,
            ),
          ),
        ),
        const SizedBox(
          width: 35,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          height: 70,
          width: 70,
          child: Image.asset(
            ImageManager.googleImage,
            cacheHeight: 31,
            cacheWidth: 31,
          ),
        ),
      ],
    );
  }
}
