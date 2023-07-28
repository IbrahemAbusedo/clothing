import 'package:flutter/material.dart';
import '../../../constants.dart';

class FavoriteProductItem extends StatefulWidget {
  const FavoriteProductItem({
    super.key,
    required this.image,
    required this.imageTitle,
    required this.price,
  });

  final String image;
  final String imageTitle;
  final String price;

  @override
  State<FavoriteProductItem> createState() => _FavoriteProductItemState();
}

class _FavoriteProductItemState extends State<FavoriteProductItem> {
  bool clicked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      // alignment: Alignment.center,
      height: 190,
      width: 154,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
          alignment: Alignment.center, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffEFEFF2),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  widget.image,
                  // fit: BoxFit.fitWidth,
                  scale: 1.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10 , bottom: 5),
              child: Text(
                widget.imageTitle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            Text(
              widget.price,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Container(
            margin: const EdgeInsetsDirectional.only(end: 11, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            height: 25,
            width: 25,
            child: IconButton(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                enableFeedback: false,
                padding: EdgeInsets.zero,
                onPressed: () => setState(() => clicked = !clicked),
                icon: Icon(clicked ? Icons.favorite : Icons.favorite_outline,
                    size: 18, color: const Color(ColorManager.mainColor))),
          ),
        )
      ]),
    );
  }
}
