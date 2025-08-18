import 'package:flutter/material.dart';

class TipRow extends StatelessWidget {
  const TipRow({
    super.key,
    required this.themeData,
    required this.totalT,
  });

  final ThemeData themeData;
  final double totalT;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Tip", style: themeData.textTheme.titleMedium),
        Text(totalT.toStringAsFixed(2), style: themeData.textTheme.titleMedium),
      ],
    );
  }
}