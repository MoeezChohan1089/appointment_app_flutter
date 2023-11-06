import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pms/utilites/constants.dart';
class CustomProggress extends StatelessWidget {
  const CustomProggress({
     this.percent,
     Key? key}) : super(key: key);
  final double? percent;
  @override
  Widget build(BuildContext context) {
    return  LinearPercentIndicator(
      //width: 150.0,
      lineHeight: 15.0,
      percent: percent!,
      backgroundColor: lightblueColor,
      progressColor: greenAccentColor,
      barRadius: const Radius.circular(15),
    );
  }
}
