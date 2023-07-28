import 'package:flutter/material.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.imageTitle,
    required this.price,
  });
  final String image;
  final String imageTitle;
  final String price;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // alignment: Alignment.center,
        height: 190,
        width: 154,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.fitWidth,
              cacheHeight: 126,
              width: 96,
              cacheWidth: 96,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                imageTitle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                price,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
