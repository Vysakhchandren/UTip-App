import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.themeData,
    required this.style,
    required this.total,
  });

  final ThemeData themeData;
  final TextStyle style;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: themeData.colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          children: [
            Text("Total Per Person", style: style),
            Text(
              total.toStringAsFixed(2),
              style: style.copyWith(
                color: themeData.colorScheme.onPrimary,
                fontSize: themeData.textTheme.displaySmall?.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}