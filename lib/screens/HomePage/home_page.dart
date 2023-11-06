
import 'package:flutter/material.dart';
import 'package:pms/provider/main_provider.dart';
import 'package:pms/screens/Drawer/custom_slider.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_parent_widget.dart';
import 'package:pms/widgets/custom_tab.dart';
import 'package:provider/provider.dart';

import '../booking/booking_screen.dart';
import '../Calendar/calendar_screen.dart';
import 'inventory_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
  @override
  initState(){
    super.initState();
    Provider.of<MainProvider>(context,listen:false).tabFuncation(this);
  }
  @override
  Widget build(BuildContext context){
    return CustomParentWidget(
      child: Scaffold(

        body: TabBarView(
          controller: Provider.of<MainProvider>(context).controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            CustomSlider(),
           // DashBoardScreen(),
             CalendarScreen(),
             BookingScreen(),
             InventoryScreen(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: mediumGreyColor,
          child: Container(
            height: 65,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
            ),
            child: TabBar(
                controller: Provider.of<MainProvider>(context).controller,
                indicatorWeight: 0.1,
                tabs: const [
                  Tab(child: CustomTab(icon: "assets/icons/ic_dashboard.png",index:0,title: "Dashboard",)),
                  Tab(child: CustomTab(icon: "assets/icons/ic_calendar_fill.png",index: 1,title: "Calendar",)),
                  Tab(child: CustomTab(icon: "assets/icons/ic_calendar2.png",index:2,title: "Booking",)),
                  Tab(child: CustomTab(icon: "assets/icons/ic_Inventory.png",index:3,title: "Inventory",)),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
