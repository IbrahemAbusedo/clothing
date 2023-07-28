import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.icon,
    required this.iconName,
    required this.value,
  });
final String icon;
final String iconName;
final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 117,
      width: 106,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(ColorManager.mainColor).withOpacity(0.07),
              borderRadius: BorderRadius.circular(22),
            ),
            width: 45,
            height: 45,
            child: Image.asset(icon,cacheWidth: 24,cacheHeight: 24,),
          ),
           Padding(
            padding:  const EdgeInsets.symmetric(vertical: 11),
            child:  Text(iconName,style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),),
          ),
           Text(value ,style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),),
        ],
      ),
    );
  }
}