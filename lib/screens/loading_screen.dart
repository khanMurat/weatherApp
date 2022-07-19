// ignore_for_file: use_build_context_synchronously, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myweather_app/apidatas/weather.dart';
import 'package:myweather_app/screens/weather_screen.dart';

class LoadingScreen extends StatefulWidget {
  static const id = 'Loading_Screen';
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Weather weather = Weather();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<dynamic> getData() async {
    var weatherData = await weather.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherScreen(weatherData: weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SpinKitSpinningLines(
          color: Colors.blue,
          size: 70.0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
