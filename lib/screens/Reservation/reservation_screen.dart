import 'package:flutter/material.dart';
import 'package:pms/provider/main_provider.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_parent_widget.dart';
import 'package:pms/widgets/custom_reservation_tab.dart';
import 'package:provider/provider.dart';

import 'data_screen.dart';
import 'payment_screen.dart';
import 'services_screen.dart';
class ReservationScreen extends StatefulWidget {
   const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> with SingleTickerProviderStateMixin {

  @override
  initState(){
    super.initState();
    Provider.of<MainProvider>(context,listen:false).reservationScreenTabFuncation(this);
  }
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Scaffold(
        backgroundColor: mediumGreyColor,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: kPrimaryColor,
        //   centerTitle: false,
        //   leading: IconButton(
        //       onPressed: (){
        //         Navigator.pop(context);
        //       },
        //       icon: Image.asset("assets/icons/ic_back.png",scale: 2.3,)),
        //   title: CustomText(
        //     title: "Add Reservation",
        //     fontSize: 17,
        //     color: whiteColor,
        //   ),
        // ),
        body: Column(
          children: [
            //Space
            const SizedBox(height: 20,),
            //TabBar
            SizedBox(
                height: 50,
                child: TabBar(
                    controller: Provider.of<MainProvider>(context).reservationScreenTabController,
                    indicatorWeight: 1,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: greenAccentColor,
                    indicatorPadding: const EdgeInsets.symmetric(horizontal: 3),
                    padding: const EdgeInsets.only(bottom: 5),
                    tabs: const [
                      Tab(child: CustomReservationTab(title: "Data",index:0,)),
                      Tab(child: CustomReservationTab(title: "Services",index:1,)),
                      Tab(child: CustomReservationTab(title: "Payment",index:2,)),
                    ]
                )
            ),
            //Space
            const SizedBox(height: 5,),
            //TabBarView
            Expanded(
              child: TabBarView(
                  physics: const ClampingScrollPhysics(),
                  controller: Provider.of<MainProvider>(context).reservationScreenTabController,
                  children: const [
                    DataScreen(),
                    ServicesScreen(),
                    PaymentScreen(),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
