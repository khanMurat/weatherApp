// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myweather_app/constant.dart';
import 'package:myweather_app/screens/city_screen.dart';
import '../conditions/condition_widget.dart';
import '../apidatas/weather.dart';
import '../conditions/condition_interpratation.dart';

class WeatherScreen extends StatefulWidget {
  static const id = 'Weather_Screen';
  final dynamic weatherData;
  WeatherScreen({this.weatherData});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather weatherJPG = Weather();
  Interpratation interpratation = Interpratation();
  String? weatherMain;
  String? cityName;
  var temperature;
  int? condition;
  double? minTemperature;
  double? maxTemperature;
  double? feelsTemperature;
  var pressure;
  int? humidity;
  var wind;
  late int temp;
  late int feelsTemp;
  late int minTemp;
  late int maxTemp;

  @override
  void initState() {
    super.initState();
    weatherInfo(widget.weatherData);
  }

  void weatherInfo(dynamic weatherData) {
    setState(() {
      try {
        condition = weatherData['weather'][0]['id'];
        weatherMain = weatherData['weather'][0]['main'];
        cityName = weatherData['name'];
        temperature = weatherData['main']['temp'];
        temp = temperature.toInt();
        feelsTemperature = weatherData['main']['feels_like'];
        feelsTemp = feelsTemperature!.toInt();
        humidity = weatherData['main']['humidity'];
        wind = weatherData['wind']['speed'];
        minTemperature = weatherData['main']['temp_min'];
        minTemp = minTemperature!.toInt();
        maxTemperature = weatherData['main']['temp_max'];
        maxTemp = maxTemperature!.toInt();
        pressure = weatherData['main']['pressure'];
        print(weatherData);
      } catch (e) {
        wind = 0;
        condition = 0;
        temp = 0;
        minTemp = 0;
        maxTemp = 0;
        feelsTemp = 0;
        humidity = 0;
        pressure = 0;
        cityName = '';
        weatherMain = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(weatherJPG.getWeatherIcon(condition!)),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.4), BlendMode.dstOut),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          var weatherData =
                              await weatherJPG.getLocationWeather();
                          weatherInfo(weatherData);
                        },
                        icon: const Icon(FontAwesomeIcons.locationArrow),
                      ),
                      IconButton(
                        onPressed: () async {
                          var valueName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) {
                                return CityScreen();
                              }),
                            ),
                          );
                          if (valueName != null) {
                            var weatherData =
                                await weatherJPG.getCityWeather(valueName);
                            weatherInfo(weatherData);
                          }
                        },
                        icon: const Icon(FontAwesomeIcons.city),
                        iconSize: 20.0,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '$cityName',
                      textAlign: TextAlign.center,
                      style: kCityNameTextStyle,
                    ),
                    kSizedBoxHeight10,
                    Text(
                      ' $temp°',
                      textAlign: TextAlign.center,
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherMain',
                      textAlign: TextAlign.center,
                      style: kWeatherMainTextStyle,
                    ),
                    Text(
                      'H:$minTemp° L: $maxTemp°',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                kSizedBoxHeight25,
                Row(
                  children: [
                    Expanded(
                      child: ConditionWidget(
                        icon: FontAwesomeIcons.temperatureHalf,
                        value: '$feelsTemp°',
                        text: 'FEELS LIKE',
                        interpratation: interpratation.getFellsTemperatureInt(
                            feelsTemp, temp),
                      ),
                    ),
                    kSizedBoxWidth10,
                    Expanded(
                      child: ConditionWidget(
                        icon: FontAwesomeIcons.water,
                        value: '$humidity',
                        text: 'HUMUDITY',
                        interpratation:
                            interpratation.getHumidityInt(humidity!),
                      ),
                    )
                  ],
                ),
                kSizedBoxHeight10,
                Row(
                  children: [
                    Expanded(
                      child: ConditionWidget(
                          icon: FontAwesomeIcons.wind,
                          text: 'WIND',
                          interpratation: 'Wind value is $wind km/h',
                          value: '$wind'),
                    ),
                    kSizedBoxWidth10,
                    Expanded(
                      child: ConditionWidget(
                          icon: FontAwesomeIcons.weightHanging,
                          value: '$pressure ',
                          text: 'PRESSURE',
                          interpratation: 'Pressure is ${pressure / 1000} hPA'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
