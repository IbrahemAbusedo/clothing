import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyCartOrder extends StatefulWidget {
  const MyCartOrder({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.date = '',
    this.isMyOrdersScreen = false,
  });
  final String image;
  final String title;
  final int subTitle;
  final bool isMyOrdersScreen;
  final String date;

  @override
  State<MyCartOrder> createState() => _MyCartOrderState();
}

class _MyCartOrderState extends State<MyCartOrder> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 2),
        tileColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            maxHeight: 86,
            maxWidth: 72,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(ColorManager.backgroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            widget.image,
            fit: BoxFit.fitWidth,
            cacheHeight: 67,
            cacheWidth: 51,
          ),
        ),
        horizontalTitleGap: 17,
        // minVerticalPadding: ,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child:  Text(
            '\$${widget.subTitle}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        trailing: Visibility(
          visible: widget.isMyOrdersScreen,
          replacement: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 26,
                  height: 21,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(ColorManager.mainColor).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      color: const Color(ColorManager.mainColor),padding: EdgeInsets.zero,onPressed: () {
                    setState(() => amount+=1);
                  }, icon: const Icon(Icons.add,size: 12,))),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '$amount',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                  width: 26,
                  height: 21,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(ColorManager.mainColor).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      color: const Color(ColorManager.mainColor),padding: const EdgeInsets.only(bottom: 5),onPressed: () {
                    setState(() {
                      amount>1? amount-=1:amount=1;
                    });
                  }, icon: const Icon(Icons.minimize_outlined,size: 12,))),
            ],
          ),
          child: Text(
            widget.date,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}