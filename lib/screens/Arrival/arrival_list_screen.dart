import 'package:flutter/material.dart';
import 'package:pms/provider/main_provider.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_arrival_tab.dart';
import 'package:pms/widgets/custom_calendar_dialogue.dart';
import 'package:pms/widgets/custom_parent_widget.dart';
// import 'package:pms/widgets/custom_tab2.dart';
// import 'package:pms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import 'today_list.dart';
import 'tomorrow_list.dart';
import 'week_list.dart';
class ArrivalListScreen extends StatefulWidget {
  const ArrivalListScreen({Key? key}) : super(key: key);

  @override
  State<ArrivalListScreen> createState() => _ArrivalListScreenState();
}

class _ArrivalListScreenState extends State<ArrivalListScreen>with SingleTickerProviderStateMixin {
  @override
  initState(){
    super.initState();
    Provider.of<MainProvider>(context,listen:false).arrivalScreenTabFuncation(this);
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
        //     title: "Arrival List",
        //     fontSize: 17,
        //     color: whiteColor,
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: (){
        //           calendarDialogue();
        //         },
        //         icon: Image.asset("assets/icons/ic_calendar.png",scale: 2.3,color: whiteColor,))
        //   ],
        // ),
        body: Column(
          children: [
            //Space
           const SizedBox(height: 20,),
            //TabBar
            SizedBox(
                height: 50,
                child: TabBar(
                    controller: Provider.of<MainProvider>(context).arrivalScreenTabController,
                    indicatorWeight: 1,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: greenAccentColor,
                    indicatorPadding:const EdgeInsets.symmetric(horizontal: 3),
                    padding:const EdgeInsets.only(bottom: 5),
                    tabs: const [
                      Tab(child: CustomArrivalTab(title: "Today",index:0,)),
                      Tab(child: CustomArrivalTab(title: "Tomorrow",index:1,)),
                      Tab(child: CustomArrivalTab(title: "This Week",index:2,)),
                    ]
                )
            ),
            //Space
           const SizedBox(height: 20,),
            //TabBarView
            Expanded(
              child: TabBarView(
                physics:const ClampingScrollPhysics(),
                  controller: Provider.of<MainProvider>(context).arrivalScreenTabController,
                  children: const [
                    TodayList(),
                    TomorrowList(),
                    WeekList(),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
  void calendarDialogue() {
    showDialog(
        context: context,
        builder: (context){
          return const CustomCalendarDialogue();
        });
  }
}
