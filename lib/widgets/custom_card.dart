import 'package:flutter/material.dart';
import 'package:pms/utilites/constants.dart';

import 'custom_button.dart';
import 'custom_text.dart';
class CustomCard extends StatelessWidget {
   const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        children: [
          //Space
          const SizedBox(height: 10,),
          //1st
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CustomText(
                      title: "Mr. John Smith",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    //Space
                    const SizedBox(width: 2,),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: greenColor
                      ),
                      child: Center(
                        child: Image.asset("assets/icons/ic_confirmed.png",scale: 2.5,color: whiteColor,),
                      ),
                    ),
                  ],
                ),

                const CustomText(
                  title: "\$1500",
                  fontSize: 16,
                  color: greenAccentColor,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          //Space
          const SizedBox(height: 5,),
          //2nd
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                CustomText(
                  title: "Deluxe Double Room 305",
                  fontSize: 13,
                  color: greyColor,
                ),
              ],
            ),
          ),
          //Space
          const SizedBox(height: 5,),
          //3rd
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CustomText(
                      title: "IN",
                      fontSize: 13,
                      color: greenColor,
                    ),
                    //Space
                    SizedBox(width: 2,),
                    CustomText(
                      title: "Jan 04, 2021",
                      fontSize: 13,
                      color: greenColor,
                    ),
                  ],
                ),

                Row(
                  children: const [
                    CustomText(
                      title: "Jan 04, 2021",
                      fontSize: 13,
                      color: blackColor,
                    ),
                    //Space
                    SizedBox(width: 2,),
                    CustomText(
                      title: "OUT",
                      fontSize: 13,
                      color: redColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Space
          const SizedBox(height: 5,),
          //Divider
          const Divider(
            height: 1,
            thickness: 1,
            color: extraLightGreyColor,
          ),
          //Status
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  title: "Status",
                  fontSize: 13,
                  color: greyColor,
                ),

                CustomButton(
                  onPressed: () {
                    // Helper.toScreen(context, PickLocationScreen());
                  },
                  btnHeight: 26,
                  btnWidth: 80,
                  btnRadius: 4,
                  title: "PAID",
                  btnColor: greenColor,
                  textColor: whiteColor,
                  fontSize: 13,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
