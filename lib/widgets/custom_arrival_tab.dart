import 'package:flutter/material.dart';
import 'package:pms/provider/main_provider.dart';
import 'package:pms/utilites/constants.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';
class CustomArrivalTab extends StatelessWidget {
  const CustomArrivalTab({
     this.title,
     this.index,
     Key? key}) : super(key: key);
 final String? title;
 final int? index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          title: title,
          fontSize: 13,
          color: Provider.of<MainProvider>(context).arrivalScreenTabController!.index==index?greenAccentColor: darkBlueColor,
        )
      ],
    );
  }
}
