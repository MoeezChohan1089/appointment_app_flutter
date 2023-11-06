import 'package:flutter/material.dart';
import 'package:pms/provider/main_provider.dart';
import 'package:pms/screens/Calendar/arrival_screen.dart';
import 'package:pms/screens/Calendar/departure_screen.dart';
import 'package:pms/screens/Calendar/new_screen.dart';
import 'package:pms/screens/Calendar/staying_screen.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_calendar_dialogue.dart';
import 'package:pms/widgets/custom_tab2.dart';
import 'package:pms/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatefulWidget {
   const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>with SingleTickerProviderStateMixin {
  @override
  initState(){
    super.initState();
    Provider.of<MainProvider>(context,listen:false).calendarScreenTabFuncation(4,this);
    selectedEvent = events[selectedDay] ?? [];
  }

  DateTime? selectedDay;
  List? selectedEvent;

  final Map<DateTime,List> events = {
   DateTime(2022,14,02):[
     {"Name": "Your event Name","isDone":true},
     {"Name": "Your event Name 2","isDone":true},
     {"Name": "Your event Name 3","isDone":false},
   ],

    DateTime(2022,14,02):[
      {"Name": "Your event Name","isDone":false},
      {"Name": "Your event Name 2","isDone":true},
      {"Name": "Your event Name 3","isDone":false},
    ],
  };
void handleData(date){
  setState(() {
    selectedDay = date;
    selectedEvent = events[selectedDay] ?? [];
  });
  // print(selectedDay);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mediumGreyColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const CustomText(
          title: "Calendar",
          fontSize: 17,
          color: whiteColor,
        ),
        actions: [
          IconButton(
              onPressed: (){
                calendarDialogue();
              },
              icon: Image.asset("assets/icons/ic_calendar.png",scale: 2.3,color: whiteColor,))
        ],
      ),
      body: Column(
        children: [
          //Space
          const SizedBox(height: 20,),
         //TabBar
          SizedBox(
            height: 50,
            child: TabBar(
                controller: Provider.of<MainProvider>(context).calendarScreenTabController,
                indicatorWeight: 1,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: greenAccentColor,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 3),
                padding: const EdgeInsets.only(bottom: 5),
                tabs: const [
                  Tab(child: CustomTab2(title: "Arrival",index:0,)),
                  Tab(child: CustomTab2(title: "Departure",index:1,)),
                  Tab(child: CustomTab2(title: "New",index:2,)),
                  Tab(child: CustomTab2(title: "Staying",index:3,)),
                ]
            )
          ),
          //Space
          const SizedBox(height: 20,),
          //TabBarView
          Expanded(
            child: TabBarView(
                controller: Provider.of<MainProvider>(context).calendarScreenTabController,
                children: const [
                  ArrivalScreen(),
                  DepartureScreen(),
                  NewScreen(),
                  StayingScreen(),
                ]
            ),
          )
        ],
      ),
    );
  }

  void calendarDialogue() {
  showDialog(
      context: context,
      builder: (context){
        return   const CustomCalendarDialogue();
      });
  }

}

