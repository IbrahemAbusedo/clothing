import 'package:flutter/material.dart';


class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.image,
    required this.imageTitle,
    this.onTap,
    this.scale = 1,
  });
  final String image;
  final String imageTitle;
  final double scale;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
       // constraints: BoxConstraints(
       //   maxHeight: 20,
       //   maxWidth: 70,
       // ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          image,
          scale: scale,
          // fit: BoxFit.cover,
          // cacheHeight: 33,
          cacheWidth: 44,
        ),
      ),
    );
  }
}
