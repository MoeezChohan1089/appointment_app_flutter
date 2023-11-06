
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pms/models/custom_model.dart';
import 'package:pms/screens/Arrival/arrival_list_screen.dart';
import 'package:pms/screens/Reservation/reservation_screen.dart';
import 'package:pms/services/dashboard_service.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/utilites/helper.dart';
import 'package:pms/widgets/custom_chart_indicator.dart';
import 'package:pms/widgets/custom_inkwell_btn.dart';
import 'package:pms/widgets/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoardScreen extends StatefulWidget {
   const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
 late List<CustomModel> _chartData;
  @override
  void initState() {
    super.initState();
    _chartData = dashboarScreenGraphList;
//    DashboardService.getDashboardData2();
  }
 final GlobalKey<ScaffoldState> mainDrawerKey = GlobalKey<ScaffoldState>();


 Map hotelData = {};
 void getHttp() async {
   try {
     Response response = await Dio().post('http://176.57.189.188:8080/Hotels/api/auth/login', data: {
       "username": "pms@digiweb.al",
       "password": "l4AavncMj3OUNaM5pb45",
     });
     // print(response.data['value']['accessToken']);

     Dio dio = Dio();
     dio.options.headers["authorization"] = "Bearer ${response.data['value']['accessToken']}";
     Response resp = await dio.get('http://176.57.189.188:8080/Hotels/api/dashBoard');
    //  print(resp.data);
     setState(() {
       hotelData = resp.data['value'];
     });
   } catch (e) {
    //  print(e);
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: futureWidget(),
    );
  }
  Widget futureWidget(){
   return FutureBuilder(
       future:  DashboardService.getDashboardData(),
       builder: (context, snapshot) {
        //  print(snapshot.data);
         if(snapshot.data == null) {
           return const Center(
             child: CircularProgressIndicator(
               backgroundColor: kPrimaryColor,
               color: kPrimaryColor,
             ),
           );
         }
         //  print(snapshot.data);
         return SingleChildScrollView(
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
               //chart
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 18),
                 child: Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                     color: whiteColor,
                     borderRadius: BorderRadius.circular(4),
                   ),
                   padding: const EdgeInsets.symmetric(
                       horizontal: 12, vertical: 12),
                   child: Column(
                     children: [
                       Container(
                         alignment: Alignment.centerLeft,
                         child: const CustomText(
                           title: "Rooms Occupied Status",
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
                                 offset: const Offset(-20.0, 0.0),
                                 child: SfCircularChart(
                                   series: <CircularSeries>[
                                     PieSeries<CustomModel, String>(
                                       dataSource: _chartData,
                                       xValueMapper: (CustomModel data,
                                           _) => data.name,
                                       yValueMapper: (CustomModel data,
                                           _) => data.per,
                                       pointColorMapper: (CustomModel data,
                                           _) =>
                                       data.bgColor,
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
                                   crossAxisAlignment: CrossAxisAlignment
                                       .end,
                                   children: List.generate(
                                       dashboarScreenGraphList
                                           .length, (index) {
                                     return Container(
                                       padding: const EdgeInsets.only(
                                           bottom: 8),
                                       child: CustomChartIndicator(
                                         title: dashboarScreenGraphList[index]
                                             .name,
                                         color: dashboarScreenGraphList[index]
                                             .bgColor,
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
               //All Rooms Status
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 18),
                 child: Container(
                   width: double.infinity,
                   height: 118,
                   decoration: BoxDecoration(
                     color: whiteColor,
                     borderRadius: BorderRadius.circular(4),
                   ),
                   padding: const EdgeInsets.symmetric(
                       horizontal: 12, vertical: 12),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const CustomText(
                         title: "All Rooms Status",
                         fontSize: 15,
                         color: blackColor,
                         fontWeight: FontWeight.w600,
                       ),
                       //Space
                       const SizedBox(height: 20,),
                       //
                       Row(
                         mainAxisAlignment: MainAxisAlignment
                             .spaceBetween,
                         children: [
                           Column(
                             children: const [
                               CustomText(
                                 title: "150",
                                 fontSize: 23,
                                 color: greenAccentColor,
                                 fontWeight: FontWeight.w600,
                               ),
                               //Space
                               SizedBox(height: 4,),
                               CustomText(
                                 title: "OCCUPIED",
                                 fontSize: 13,
                                 color: greyColor,
                                 fontWeight: FontWeight.w600,
                               ),
                             ],
                           ),
                           Column(
                             children: const [
                               CustomText(
                                 title: "100",
                                 fontSize: 23,
                                 color: greenAccentColor,
                                 fontWeight: FontWeight.w600,
                               ),
                               //Space
                               SizedBox(height: 4,),
                               CustomText(
                                 title: "FREE",
                                 fontSize: 13,
                                 color: greyColor,
                                 fontWeight: FontWeight.w600,
                               ),
                             ],
                           ),
                           Column(
                             children: const [
                               CustomText(
                                 title: "40",
                                 fontSize: 23,
                                 color: greenAccentColor,
                                 fontWeight: FontWeight.w600,
                               ),
                               //Space
                               SizedBox(height: 4,),
                               CustomText(
                                 title: "% FREE",
                                 fontSize: 13,
                                 color: greyColor,
                                 fontWeight: FontWeight.w600,
                               ),
                             ],
                           ),
                         ],
                       ),
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
                   padding: const EdgeInsets.symmetric(
                       horizontal: 12, vertical: 15),
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
                             itemBuilder: (context, index) {
                               return Container(
                                 padding: const EdgeInsets.only(right: 10),
                                 child: CustomInkWell(
                                   onTap: () {
                                   },
                                   child: SizedBox(
                                     height: 160,
                                     width: 140,
                                     child: Card(
                                       elevation: 3,
                                       shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius
                                               .circular(6)
                                       ),
                                       clipBehavior: Clip.hardEdge,
                                       child: Column(
                                         children: [
                                           Expanded(
                                             child: Container(
                                               width: 140,
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius
                                                       .circular(6),
                                                   image: const DecorationImage(
                                                       fit: BoxFit.cover,
                                                       image: AssetImage(
                                                           "assets/images/room_img.jpg"))
                                               ),
                                             ),
                                           ),
                                           //Space
                                           const SizedBox(height: 5,),
                                           //
                                           Container(
                                             padding: const EdgeInsets
                                                 .symmetric(
                                                 horizontal: 8),
                                             alignment: Alignment
                                                 .centerLeft,
                                             child: const CustomText(
                                               title: "Double Deluxe Room",
                                               fontSize: 15,
                                               color: blackColor,
                                               fontWeight: FontWeight
                                                   .w600,
                                             ),
                                           ),
                                           //Space
                                           const SizedBox(height: 5,),
                                         ],
                                       ),
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
                   padding: const EdgeInsets.only(
                       left: 12, right: 12, top: 15, bottom: 0),
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
                         mainAxisAlignment: MainAxisAlignment
                             .spaceBetween,
                         children: [
                           CustomInkWell(
                             onTap: () {
                               Helper.toScreen(
                                   context, const ArrivalListScreen());
                             },
                             child: const CustomText(
                               title: "Arrival",
                               fontSize: 15,
                               color: blackColor,
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                           const CustomText(
                             title: "Departure",
                             fontSize: 15,
                             color: greenAccentColor,
                             fontWeight: FontWeight.w600,
                           ),
                           CustomInkWell(
                             onTap: () {
                               Helper.toScreen(
                                   context, const ReservationScreen());
                             },
                             child: const CustomText(
                               title: "Reservation",
                               fontSize: 15,
                               color: blackColor,
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                         ],
                       ),
                       //Space
                       const SizedBox(height: 5,),
                       //
                       Column(
                           children: List.generate(3, (index) {
                             return Container(
                               padding: const EdgeInsets.only(bottom: 15),
                               child: Card(
                                 elevation: 2,
                                 margin: const EdgeInsets.symmetric(
                                     horizontal: 0),
                                 child: Container(
                                   height: 65,
                                   padding: const EdgeInsets.symmetric(
                                       horizontal: 12),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment
                                         .center,
                                     crossAxisAlignment: CrossAxisAlignment
                                         .start,
                                     children: [
                                       Row(
                                         children: const [
                                           Expanded(
                                             child: CustomText(
                                               title: "Mr, John Smith",
                                               fontSize: 16,
                                               color: blackColor,
                                               fontWeight: FontWeight
                                                   .w600,
                                             ),
                                           ),
                                           CustomText(
                                             title: "\$1000",
                                             fontSize: 16,
                                             color: greenAccentColor,
                                             fontWeight: FontWeight
                                                 .w600,
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
         );
       }
   );
  }


  Widget simpleWidget(){
   return SingleChildScrollView(
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
         //chart
         Container(
           padding: const EdgeInsets.symmetric(horizontal: 18),
           child: Container(
             width: double.infinity,
             decoration: BoxDecoration(
               color: whiteColor,
               borderRadius: BorderRadius.circular(4),
             ),
             padding: const EdgeInsets.symmetric(
                 horizontal: 12, vertical: 12),
             child: Column(
               children: [
                 Container(
                   alignment: Alignment.centerLeft,
                   child: const CustomText(
                     title: "Rooms Occupied Status",
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
                           offset: const Offset(-20.0, 0.0),
                           child: SfCircularChart(
                             series: <CircularSeries>[
                               PieSeries<CustomModel, String>(
                                 dataSource: _chartData,
                                 xValueMapper: (CustomModel data,
                                     _) => data.name,
                                 yValueMapper: (CustomModel data,
                                     _) => data.per,
                                 pointColorMapper: (CustomModel data,
                                     _) =>
                                 data.bgColor,
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
                             crossAxisAlignment: CrossAxisAlignment
                                 .end,
                             children: List.generate(
                                 dashboarScreenGraphList
                                     .length, (index) {
                               return Container(
                                 padding: const EdgeInsets.only(
                                     bottom: 8),
                                 child: CustomChartIndicator(
                                   title: dashboarScreenGraphList[index]
                                       .name,
                                   color: dashboarScreenGraphList[index]
                                       .bgColor,
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
         //All Rooms Status
         Container(
           padding: const EdgeInsets.symmetric(horizontal: 18),
           child: Container(
             width: double.infinity,
             height: 118,
             decoration: BoxDecoration(
               color: whiteColor,
               borderRadius: BorderRadius.circular(4),
             ),
             padding: const EdgeInsets.symmetric(
                 horizontal: 12, vertical: 12),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const CustomText(
                   title: "All Rooms Status",
                   fontSize: 15,
                   color: blackColor,
                   fontWeight: FontWeight.w600,
                 ),
                 //Space
                 const SizedBox(height: 20,),
                 //
                 Row(
                   mainAxisAlignment: MainAxisAlignment
                       .spaceBetween,
                   children: [
                     Column(
                       children: const [
                         CustomText(
                           title: "150",
                           fontSize: 23,
                           color: greenAccentColor,
                           fontWeight: FontWeight.w600,
                         ),
                         //Space
                         SizedBox(height: 4,),
                         CustomText(
                           title: "OCCUPIED",
                           fontSize: 13,
                           color: greyColor,
                           fontWeight: FontWeight.w600,
                         ),
                       ],
                     ),
                     Column(
                       children: const [
                         CustomText(
                           title: "100",
                           fontSize: 23,
                           color: greenAccentColor,
                           fontWeight: FontWeight.w600,
                         ),
                         //Space
                         SizedBox(height: 4,),
                         CustomText(
                           title: "FREE",
                           fontSize: 13,
                           color: greyColor,
                           fontWeight: FontWeight.w600,
                         ),
                       ],
                     ),
                     Column(
                       children: const [
                         CustomText(
                           title: "40",
                           fontSize: 23,
                           color: greenAccentColor,
                           fontWeight: FontWeight.w600,
                         ),
                         //Space
                         SizedBox(height: 4,),
                         CustomText(
                           title: "% FREE",
                           fontSize: 13,
                           color: greyColor,
                           fontWeight: FontWeight.w600,
                         ),
                       ],
                     ),
                   ],
                 ),
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
             padding: const EdgeInsets.symmetric(
                 horizontal: 12, vertical: 15),
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
                       itemBuilder: (context, index) {
                         return Container(
                           padding: const EdgeInsets.only(right: 10),
                           child: CustomInkWell(
                             onTap: () {
                               // print(UserModel().accessToken);
                               // DashboardService.getDashboardData();
                               getHttp();
                             },
                             child: SizedBox(
                               height: 160,
                               width: 140,
                               child: Card(
                                 elevation: 3,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius
                                         .circular(6)
                                 ),
                                 clipBehavior: Clip.hardEdge,
                                 child: Column(
                                   children: [
                                     Expanded(
                                       child: Container(
                                         width: 140,
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius
                                                 .circular(6),
                                             image: const DecorationImage(
                                                 fit: BoxFit.cover,
                                                 image: AssetImage(
                                                     "assets/images/room_img.jpg"))
                                         ),
                                       ),
                                     ),
                                     //Space
                                     const SizedBox(height: 5,),
                                     //
                                     Container(
                                       padding: const EdgeInsets
                                           .symmetric(
                                           horizontal: 8),
                                       alignment: Alignment
                                           .centerLeft,
                                       child: const CustomText(
                                         title: "Double Deluxe Room",
                                         fontSize: 15,
                                         color: blackColor,
                                         fontWeight: FontWeight
                                             .w600,
                                       ),
                                     ),
                                     //Space
                                     const SizedBox(height: 5,),
                                   ],
                                 ),
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
             padding: const EdgeInsets.only(
                 left: 12, right: 12, top: 15, bottom: 0),
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
                   mainAxisAlignment: MainAxisAlignment
                       .spaceBetween,
                   children: [
                     CustomInkWell(
                       onTap: () {
                         Helper.toScreen(
                             context, const ArrivalListScreen());
                       },
                       child: const CustomText(
                         title: "Arrival",
                         fontSize: 15,
                         color: blackColor,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                     const CustomText(
                       title: "Departure",
                       fontSize: 15,
                       color: greenAccentColor,
                       fontWeight: FontWeight.w600,
                     ),
                     CustomInkWell(
                       onTap: () {
                         Helper.toScreen(
                             context, const ReservationScreen());
                       },
                       child: const CustomText(
                         title: "Reservation",
                         fontSize: 15,
                         color: blackColor,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ],
                 ),
                 //Space
                 const SizedBox(height: 5,),
                 //
                 Column(
                     children: List.generate(3, (index) {
                       return Container(
                         padding: const EdgeInsets.only(bottom: 15),
                         child: Card(
                           elevation: 2,
                           margin: const EdgeInsets.symmetric(
                               horizontal: 0),
                           child: Container(
                             height: 65,
                             padding: const EdgeInsets.symmetric(
                                 horizontal: 12),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment
                                   .center,
                               crossAxisAlignment: CrossAxisAlignment
                                   .start,
                               children: [
                                 Row(
                                   children: const [
                                     Expanded(
                                       child: CustomText(
                                         title: "Mr, John Smith",
                                         fontSize: 16,
                                         color: blackColor,
                                         fontWeight: FontWeight
                                             .w600,
                                       ),
                                     ),
                                     CustomText(
                                       title: "\$1000",
                                       fontSize: 16,
                                       color: greenAccentColor,
                                       fontWeight: FontWeight
                                           .w600,
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
   );
  }
}
