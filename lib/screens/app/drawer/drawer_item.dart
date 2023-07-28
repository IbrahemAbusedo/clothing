import 'package:clothing/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class drawerItem extends StatelessWidget {
  const drawerItem({
    super.key,
    required this.imageIcon,
    required this.title,
    required this.onTap,
  });

  final String imageIcon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 13,
      // tileColor: Colors.blue,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(22),bottomEnd: Radius.circular(22)),
      // ),
      onTap: onTap,
      leading: Container(
        decoration: BoxDecoration(
            color: const Color(ColorManager.mainColor).withOpacity(0.10),
            borderRadius: BorderRadius.circular(5)),
        height: 24,
        width: 27,
        child: Image.asset(
          imageIcon,
          cacheHeight: 14,
          cacheWidth: 14,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
      ),
      visualDensity:
          const VisualDensity(horizontal: VisualDensity.minimumDensity),
    );
  }
}
