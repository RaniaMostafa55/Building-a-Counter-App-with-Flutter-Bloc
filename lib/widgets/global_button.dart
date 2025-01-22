import 'package:flutter/material.dart';

//A widget to show a button with certain style
class GlobalButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  const GlobalButton({required this.onPressed, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: CircleAvatar(radius: 20, child: Icon(icon)));
  }
}
