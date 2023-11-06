import 'package:flutter/material.dart';
import 'package:pms/utilites/constants.dart';

import 'custom_text.dart';
class CustomCalendarScreenTimeWidget extends StatelessWidget {
  const CustomCalendarScreenTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color: greenAccentColor
                )
            )
        ),
        child: const CustomText(
          title: "Today",
          fontSize: 14,
          color: greenAccentColor,
        ),
      ),
    );
  }
}
