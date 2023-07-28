import 'package:flutter/material.dart';

import '../../../constants.dart';

class ColorToggle extends StatefulWidget {
  const ColorToggle({Key? key}) : super(key: key);

  @override
  State<ColorToggle> createState() => _ColorToggleState();
}

class _ColorToggleState extends State<ColorToggle> {
  List<bool> isSelected = [false, true, false, false];
  List<int> colorList = <int>[0xFFBEE8EA, 0xFF141B4A, 0xFFCEE3F5, 0xFFF4E5C3];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(isSelected.length, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                if (i == index) {
                  isSelected[i] = true;
                } else {
                  isSelected[i] = false;
                }
              }
            });
          },
          child: Container(
            margin: EdgeInsets.all(2),
            width:isSelected[index]?24: 30,
            height: isSelected[index]?24: 30,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: isSelected[index]
                    ? const Color(ColorManager.mainColor)
                    : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(colorList[index]),
                ),
              ),
            ),
          ),
        );

      }),
    );
  }
}
