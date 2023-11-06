import 'package:flutter/material.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_calendar_screen_timewidget.dart';
import 'package:pms/widgets/custom_card.dart';
import 'package:pms/widgets/custom_text.dart';
class StayingScreen extends StatelessWidget {
  const StayingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //time
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20)
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(20, (index){
                  return const CustomCalendarScreenTimeWidget();
                }),
              ),
            ),
          ),
        ),
        //Space
        const SizedBox(height: 20,),
        Expanded(
          child:  Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
            ),
            child: Column(
              children: [
                //Space
                const SizedBox(height: 20,),
                //Reservations
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.centerLeft,
                  child: const CustomText(
                    title: "Reservations",
                    fontSize: 16,
                    color: darkBlueColor,
                  ),
                ),
                //Space
                const SizedBox(height: 10,),
                //
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: const CustomCard(),
                        );
                      }),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
