// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myweather_app/constant.dart';

class ConditionWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? interpratation;
  final String value;

  ConditionWidget({
    required this.icon,
    required this.text,
    required this.interpratation,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 120),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color.fromARGB(255, 71, 73, 71).withOpacity(0.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 12.5,
              ),
              kSizedBoxWidth5,
              Text(
                text,
                style: TextStyle(fontSize: 12.5),
              )
            ],
          ),
          kSizedBoxWidth5,
          Text(
            value,
            style: TextStyle(fontSize: 20),
          ),
          Divider(
            color: Colors.red[200],
          ),
          Text(interpratation!),
        ],
      ),
    );
  }
}
