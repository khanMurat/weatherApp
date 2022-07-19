// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myweather_app/screens/city_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        WeatherScreen.id: (context) => WeatherScreen(),
        CityScreen.id: (context) => CityScreen(),
      },
    );
  }
}
