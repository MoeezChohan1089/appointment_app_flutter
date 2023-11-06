import 'package:flutter/material.dart';
import 'package:pms/models/custom_model.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_chart_indicator.dart';
import 'package:pms/widgets/custom_proggress.dart';
import 'package:pms/widgets/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class DashBoardScreen1 extends StatefulWidget {
   const DashBoardScreen1({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen1> createState() => _DashBoardScreen1State();
}

class _DashBoardScreen1State extends State<DashBoardScreen1> {
  late List<CustomModel> _chartData;
  @override
  void initState() {
    super.initState();
    _chartData = dashboarScreenGraphList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mediumGreyColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
            onPressed: (){},
            icon: Image.asset("assets/icons/ic_menu.png",scale: 2.3,)),
        title: const CustomText(
          title: "Dashboard",
          fontSize: 17,
          color: whiteColor,
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Image.asset("assets/icons/ic_add.png",scale: 2.3,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Space
            const SizedBox(height: 20,),
            //date
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.centerLeft,
              child: const CustomText(
                title: "March 6,2021",
                fontSize: 18,
                color: lightBlueColor,
              ),
            ),
            //Space
            const SizedBox(height: 20,),
            //
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                width: double.infinity,
                height: 85,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const CustomText(
                            title: "Departure",
                            fontSize: 15,
                            color: extraLightBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                          //Space
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomText(
                                title: "35",
                                fontSize: 23,
                                color: greenAccentColor,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                title: "/40",
                                fontSize: 15,
                                color: extraLightBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //
                    const VerticalDivider(width: 1,color: lightGreyColor,thickness: 1,),
                    //
                    Expanded(
                      child: Column(
                        children: [
                          const CustomText(
                            title: "Arrival",
                            fontSize: 15,
                            color: extraLightBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                          //Space
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomText(
                                title: "88",
                                fontSize: 23,
                                color: greenAccentColor,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                title: "/99",
                                fontSize: 15,
                                color: extraLightBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //
                    const VerticalDivider(width: 1,color: lightGreyColor,thickness: 1,),
                    Expanded(
                      child: Column(
                        children: [
                          const CustomText(
                            title: "Reserved",
                            fontSize: 15,
                            color: extraLightBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                          //Space
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomText(
                                title: "125",
                                fontSize: 23,
                                color: greenAccentColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Space
            const SizedBox(height: 20,),
            //chart
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const CustomText(
                        title: "Rooms Status",
                        fontSize: 15,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 177,
                      child: Row(
                        children: [
                          Expanded(
                            child: Transform.translate(
                              offset: const Offset(-20.0,0.0),
                              child: SfCircularChart(
                                series: <CircularSeries>[
                                  PieSeries<CustomModel,String>(
                                    dataSource: _chartData,
                                    xValueMapper: (CustomModel data,_)=> data.name,
                                    yValueMapper: (CustomModel data,_)=> data.per,
                                    pointColorMapper: (CustomModel data,_) => data.bgColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Space
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: List.generate(dashboarScreenGraphList.length, (index){
                                  return Container(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: CustomChartIndicator(
                                      title: dashboarScreenGraphList[index].name,
                                      color: dashboarScreenGraphList[index].bgColor,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Space
            const SizedBox(height: 20,),
            //proggress
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const CustomText(
                        title: "Rooms Status",
                        fontSize: 15,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //Space
                    const SizedBox(height: 15,),
                    //Available Rooms
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Available Rooms",
                            fontSize: 12,
                            color: lightBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        const Expanded(
                          child:CustomProggress(percent: 0.25,),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "25",
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    //Space
                    const SizedBox(height: 13,),
                    //Booked Rooms
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Booked Rooms",
                            fontSize: 12,
                            color: lightBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        const Expanded(
                          child:CustomProggress(percent: 0.55,),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "55",
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    //Space
                    const SizedBox(height: 13,),
                    //Reserved Rooms
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Reserved Rooms",
                            fontSize: 12,
                            color: lightBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        const Expanded(
                          child:CustomProggress(percent: 0.12,),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "12",
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    //Space
                    const SizedBox(height: 13,),
                    //Under Work
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Under Work",
                            fontSize: 12,
                            color: lightBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        const Expanded(
                          child:CustomProggress(percent: 0.10,),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "08",
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    //Space
                    const SizedBox(height: 13,),
                    //Occupancy
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Occupancy",
                            fontSize: 12,
                            color: lightBlueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        const Expanded(
                          child:CustomProggress(percent: 0.67,),
                        ),
                        //Space
                        const SizedBox(width: 8,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "67",
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    //Space
                    const SizedBox(height: 12,),
                  ],
                ),
              ),
            ),
            //Space
            const SizedBox(height: 20,),
            //rooms
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                child: Column(
                  children: [
                    //Free Rooms
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const CustomText(
                        title: "Free Rooms",
                        fontSize: 15,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //Space
                    const SizedBox(height: 5,),
                    //card
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                height: 160,
                                width: 140,
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 140,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6),
                                              image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage("assets/images/room_img.jpg"))
                                          ),
                                        ),
                                      ),
                                      //Space
                                      const SizedBox(height: 5,),
                                      //
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        alignment: Alignment.centerLeft,
                                        child: const CustomText(
                                          title: "Double Deluxe Room",
                                          fontSize: 15,
                                          color: blackColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      //Space
                                      const SizedBox(height: 5,),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            //Space
            const SizedBox(height: 20,),
            //Today List
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.only(left: 12,right: 12,top: 15,bottom: 0),
                child: Column(
                  children: [
                    //Today List
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const CustomText(
                        title: "Today List",
                        fontSize: 15,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //Space
                    const SizedBox(height: 5,),
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(
                          title: "Arrival",
                          fontSize: 15,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          title: "Departure",
                          fontSize: 15,
                          color: greenAccentColor,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          title: "Reservation",
                          fontSize: 15,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    //Space
                    const SizedBox(height: 5,),
                    //
                    Column(
                        children: List.generate(3, (index){
                          return Container(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Card(
                              elevation: 2,
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                height: 65,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Expanded(
                                          child: CustomText(
                                            title: "Mr, John Smith",
                                            fontSize: 16,
                                            color: blackColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        CustomText(
                                          title: "\$1000",
                                          fontSize: 16,
                                          color: greenAccentColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    //Space
                                    const SizedBox(height: 6,),
                                    const CustomText(
                                      title: "Standard Single Room 259",
                                      fontSize: 13,
                                      color: greyColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    )
                  ],
                ),
              ),
            ),
            //Space
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
