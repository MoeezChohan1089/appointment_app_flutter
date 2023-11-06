import 'package:flutter/material.dart';
import 'package:pms/screens/Arrival/arrival_list_screen.dart';
import 'package:pms/screens/Reservation/reservation_screen.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/utilites/helper.dart';
import 'package:pms/widgets/custom_inkwell_btn.dart';
import 'package:pms/widgets/custom_text.dart';
class CustomDrawer extends StatelessWidget {
   const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Column(
          children: [
            //Space
            const SizedBox(height: 50,),
            //logo
            Image.asset( "assets/icons/ic_app.png",scale: 30,),
            //Space
            const SizedBox(height: 50,),
            //Dashboard
            CustomInkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                height: 50,
                color: mediumGreyColor,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      title: "Dashboard",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                    Image.asset("assets/icons/ic_forward.png",scale: 2,color: kPrimaryColor,)
                  ],
                ),
              ),
            ),
            //Space
            const SizedBox(height: 10,),
            //Arrival
            CustomInkWell(
              onTap: (){
                Navigator.pop(context);
                Helper.toScreen(context, const ArrivalListScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                height: 50,
                color: mediumGreyColor,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      title: "Arrival",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                    Image.asset("assets/icons/ic_forward.png",scale: 2,color: kPrimaryColor,)
                  ],
                ),
              ),
            ),
            //Space
            const SizedBox(height: 10,),
            //Departure
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              height: 50,
              color: mediumGreyColor,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    title: "Departure",
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor,
                  ),
                  Image.asset("assets/icons/ic_forward.png",scale: 2,color: kPrimaryColor,)
                ],
              ),
            ),
            //Space
            const SizedBox(height: 10,),
            //Reservation
            CustomInkWell(
              onTap: (){
                Navigator.pop(context);
                Helper.toScreen(context, const ReservationScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                height: 50,
                color: mediumGreyColor,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      title: "Reservation",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                    Image.asset("assets/icons/ic_forward.png",scale: 2,color: kPrimaryColor,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
