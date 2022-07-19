import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myweather_app/constant.dart';

class CityScreen extends StatefulWidget {
  static const String id = 'City_Screen';
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/city_screen.jpeg'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SafeArea(
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    FontAwesomeIcons.arrowLeft,
                  ),
                ),
              ],
            ),
            kSizedBoxHeight20,
            TextField(
              autofocus: true,
              style: TextStyle(color: Colors.black),
              onChanged: ((value) {
                cityName = value;
              }),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.search,
                  size: 15,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0.4),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search for a city name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            kSizedBoxHeight20,
            TextButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              child: Text(
                'GET WEATHER',
                style: kGetWeatherTextStyle,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
