import 'package:calculator_app/providers/tip_calculator_model.dart';
import 'package:calculator_app/utip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => TipCalculatorModel(),
  child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTip App',
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      // follow system light/dark
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light, // ✅ brightness is set here
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark, // ✅ brightness is set here
        ),
        useMaterial3: true,
      ),
      home: UTip(
        isDark: _isDark,
        onThemeChanged: (bool value) {
          setState(() {
            _isDark = value;
          });
        },
      ),
    );
  }
}
