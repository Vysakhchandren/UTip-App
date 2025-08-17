import 'dart:developer';
import 'package:flutter/material.dart';
class PersonCounter extends StatelessWidget {

  const PersonCounter({
    super.key,
    required this.themeData,
    required int personCount,
    required this.onIncrement,
    required this.onDecrement,
  }) : _personCount = personCount;

  final ThemeData themeData;
  final int _personCount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    log("Inside the person counter");
    return Row(
      children: [
        IconButton(
          onPressed: onDecrement,
          icon: Icon(Icons.remove),
          color: themeData.colorScheme.primary,
        ),
        Text(_personCount.toString(), style: themeData.textTheme.titleMedium),
        IconButton(
          onPressed: onIncrement,
          icon: Icon(Icons.add),
          color: themeData.colorScheme.primary,
        ),
      ],
    );
  }
}