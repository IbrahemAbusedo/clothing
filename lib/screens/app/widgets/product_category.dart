import 'package:flutter/material.dart';


class ProductCategory extends StatelessWidget {
  const ProductCategory({
    super.key,
    required this.image,
    required this.imageTitle,
    this.onTap,
  });
  final String image;
  final String imageTitle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
// alignment: Alignment.center,
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
              BorderSide(color: Colors.black12, width: 0.8)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              cacheHeight: 37,
              cacheWidth: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                imageTitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
