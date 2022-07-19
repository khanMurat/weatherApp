import 'package:flutter/material.dart';
import 'network.dart';
import 'location.dart';

const apiKey = 'a99178578bf98e8e6f305d08df74a477';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class Weather {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getWeatherData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getWeatherData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'images/rainy.jpeg';
    } else if (condition < 400) {
      return 'images/rainy.jpeg';
    } else if (condition < 600) {
      return 'images/rainy.jpeg';
    } else if (condition < 700) {
      return 'images/winter.jpg';
    } else if (condition < 800) {
      return 'images/foggy.jpg';
    } else if (condition == 800) {
      return 'images/sunny.jpeg';
    } else if (condition <= 804) {
      return 'images/cloudy.jpg';
    } else {
      return '🤷‍';
    }
  }
}
