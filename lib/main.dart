import 'package:flutter/material.dart';
import 'package:weather_scan/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        popupMenuTheme: const PopupMenuThemeData(
          color: Color.fromARGB(255, 29, 28, 28),
          textStyle: TextStyle(color: Colors.white),
        ),
        fontFamily: 'Lato',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        textTheme: const TextTheme(
          labelMedium: TextStyle(
            color: Colors.white,
            fontSize: 17,
            // fontWeight: FontWeight.bold,
          ),
          labelSmall: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 26,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          
        ),
      ),
      home: const HomePage(),
    );
  }
}
