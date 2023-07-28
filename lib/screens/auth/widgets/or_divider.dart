import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
    required this.top,
    required this.bottom,
  });
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top,bottom: bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '_______________',
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.w800),
          ),
          Padding(
            padding: EdgeInsets.only(left: 19, right: 19, top: 10),
            child: Text('Or'),
          ),
          Text(
            '_______________',
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
