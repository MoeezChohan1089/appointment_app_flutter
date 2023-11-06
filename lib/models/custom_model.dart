import 'dart:ui';

import 'package:pms/utilites/constants.dart';
class CustomModel {
  String? title;
  String? subTitle;
  String? name;
  int? per;
  String? img;
  Color? bgColor;
  Color? textColor;

  CustomModel({
    this.title,
    this.subTitle,
    this.name,
    this.per,
    this.img,
    this.bgColor,
    this.textColor
  });

}
//BulkScreen
List<CustomModel> dashboarScreenGraphList =[
  CustomModel(name: "Standard Double 35%",per: 35,bgColor: mediumGreenColor),
  CustomModel(name: "Deluxe Suite 15%",per: 15,bgColor: orangeColor),
  CustomModel(name: "Vip Room 15%",per: 15,bgColor: purpleColor),
  CustomModel(name: "Superior Double 14%",per: 14,bgColor: lightOrangeColor),
  CustomModel(name: "Cabana 10%",per: 10,bgColor: lightBlueColor1),
  CustomModel(name: "Double Twin 09%",per: 09,bgColor: lightRedColor1),
  CustomModel(name: "Triple Room 02%",per: 35,bgColor: lightPinkColor1),
];