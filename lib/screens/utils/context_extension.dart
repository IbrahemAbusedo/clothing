import 'package:flutter/material.dart';

extension ContextExtension on BuildContext{
  void showSnackBar({required String message , bool error = false}){
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(
        message
    ),
      backgroundColor:error ?Colors.red.shade800 : Colors.blue.shade500,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,

    ),);
  }
}