import 'package:flutter/material.dart';

//A widget to show the counter value
class CounterValueText extends StatelessWidget {
  final String text;
  const CounterValueText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
