import 'package:flutter/material.dart';
import '../../../constants.dart';

class SearchProductItem extends StatefulWidget {
  const SearchProductItem({
    super.key,
    required this.image,
    required this.imageTitle,
    required this.price,
    this.onTap,
  });

  final String image;
  final String imageTitle;
  final String price;
  final Function()? onTap;

  @override
  State<SearchProductItem> createState() => _SearchProductItemState();
}

class _SearchProductItemState extends State<SearchProductItem> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onTap: widget.onTap,
      child: Container(
        // alignment: Alignment.center,
        height: 190,
        width: 154,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(alignment: Alignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.image,
                fit: BoxFit.fitWidth,
                cacheHeight: 126,
                width: 96,
                cacheWidth: 96,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  widget.imageTitle,
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
                  widget.price,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              margin: const EdgeInsetsDirectional.only(end: 12, top: 12),
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
      ),
    );
  }
}
