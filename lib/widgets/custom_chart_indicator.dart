import 'package:flutter/material.dart';
import 'package:pms/utilites/constants.dart';

import 'custom_text.dart';
class CustomChartIndicator extends StatelessWidget {
  const CustomChartIndicator({
     this.color,
     this.title,
     Key? key}) : super(key: key);
  final Color? color;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
          ),
        ),
        //Space
        const SizedBox(width: 6,),
        //
        CustomText(
          title: title,
          fontSize: 10,
          color: mediumBlackColor,
        )
      ],
    );
  }
}
