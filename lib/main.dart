import 'package:calculator_app/providers/theme_provider.dart';
import 'package:calculator_app/providers/tip_calculator_model.dart';
import 'package:calculator_app/utip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TipCalculatorModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
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

    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTip App',
      theme: themeProvider.currentTheme,
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
