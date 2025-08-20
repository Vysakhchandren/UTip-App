import 'package:flutter/material.dart';

class TipRow extends StatelessWidget {
  const TipRow({
    super.key,
    required this.themeData,
    required this.billTotal,
    required this.percentage,
  });

  final ThemeData themeData;
  final double billTotal;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Tip", style: themeData.textTheme.titleMedium),
        Text("\$${(billTotal * percentage).toStringAsFixed(2)}",
            style: themeData.textTheme.titleMedium),
      ],
    );
  }
}