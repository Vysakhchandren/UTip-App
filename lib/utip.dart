import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme.dart';

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  @override
  Widget build(BuildContext context) {
    print(context.widget);
    var themeData = Theme.of(context);
    final style = themeData.textTheme.titleMedium!.copyWith(
      color: themeData.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: Text("UTip")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
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
                    "\$24.45",
                    style: style.copyWith(
                      color: themeData.colorScheme.onPrimary,
                      fontSize: themeData.textTheme.displaySmall?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
