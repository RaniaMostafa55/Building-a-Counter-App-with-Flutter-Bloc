import 'package:flutter/material.dart';

//A function to open a dialog with certain message
void createDialog(context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          message,
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      );
    },
  );
}
