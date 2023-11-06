import 'package:flutter/material.dart';
import 'package:pms/provider/main_provider.dart';
import 'package:pms/utilites/constants.dart';
import 'package:provider/provider.dart';
import 'custom_text.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({this.icon, this.title, this.index, Key? key})
      : super(key: key);
  final String? icon;
  final String? title;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //icon
        Image.asset(
          icon!,
          scale: 2.3,
          color: Provider.of<MainProvider>(context).controller!.index == index
              ? greenAccentColor
              : greyColor,
        ),
        //Space
        const SizedBox(
          height: 5,
        ),
        CustomText(
          title: title,
          fontSize: 10,
          color: Provider.of<MainProvider>(context).controller!.index == index
              ? greenAccentColor
              : greyColor,
        )
      ],
    );
  }
}
