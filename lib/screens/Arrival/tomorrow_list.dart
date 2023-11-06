import 'package:flutter/material.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_card.dart';
import 'package:pms/widgets/custom_text.dart';
class TomorrowList extends StatelessWidget {
  const TomorrowList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration:const BoxDecoration(
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
          //Guests
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 18),
            alignment: Alignment.centerLeft,
            child: const CustomText(
              title: "Guests Arrived",
              fontSize: 16,
              color: darkBlueColor,
            ),
          ),
          //Space
         const SizedBox(height: 10,),
          //
          Expanded(
            child: ListView.builder(
                padding:const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics:const ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index){
                  return Container(
                    padding:const EdgeInsets.only(bottom: 5),
                    child: const CustomCard(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
