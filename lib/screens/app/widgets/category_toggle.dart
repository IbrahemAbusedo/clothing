import 'package:flutter/material.dart';

import '../../../constants.dart';

class CategoryToggle extends StatefulWidget {
  const CategoryToggle({Key? key}) : super(key: key);

  @override
  State<CategoryToggle> createState() => _CategoryToggleState();
}

class _CategoryToggleState extends State<CategoryToggle> {
  List<bool> isSelected = [true, false, false];
  List<String> categoryList = ['New Arrival', 'Top Trading', 'Featured Products'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(isSelected.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 0),
            child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity)),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++){
                      if (i == index) {
                        isSelected[i] = true;
                      } else {
                        isSelected[i] = false;
                      }
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(11),
                  constraints: const BoxConstraints(
                    minWidth: 92, minHeight: 46
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(isSelected[index] ? ColorManager.mainColor: 0xffffff) ,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    categoryList[index],
                    style: TextStyle(
                        color: isSelected[index] ? Colors.white : Colors.black),
                  ),
                )),
          );
        }),
      ),
    );
  }
}
