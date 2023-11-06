import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_button.dart';
import 'package:pms/widgets/custom_parent_widget.dart';
import 'package:pms/widgets/custom_text.dart';
class ReservationDetailScreen extends StatelessWidget {
   const ReservationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Scaffold(
        backgroundColor: mediumGreyColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          centerTitle: false,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Image.asset("assets/icons/ic_back.png",scale: 2.3,)),
          title: const CustomText(
            title: "Reservation Detail",
            fontSize: 17,
            color: whiteColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Space
              const SizedBox(height: 15,),
            //Slider
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child:  const Carousel(
                    images: [
                      AssetImage("assets/images/slider_img.png"),
                      AssetImage("assets/images/slider_img.png"),
                      AssetImage("assets/images/slider_img.png"),
                    ],
                    showIndicator: true,
                    indicatorBgPadding: 25,
                    radius: Radius.circular(15),
                    dotIncreasedColor: greenAccentColor,
                    dotIncreaseSize: 1.1,
                    dotSize: 8,
                    dotSpacing: 15,
                    dotColor: greyColor,
                    dotBgColor: Colors.transparent,
                    autoplay: true,
                  )),
                ),
              //Space
              const SizedBox(height: 15,),
              Container(
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
                    const SizedBox(height: 15,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const CustomText(
                              title: "#305",
                              fontSize: 13,
                              color: blackColor,
                            ),
                          ),
                          //Space
                          const SizedBox(height: 4,),
                          //Double Deluxe Room
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "Double Deluxe Room",
                                  fontSize: 15,
                                  color: blackColor,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "\$1700",
                                  fontSize: 15,
                                  color: greenAccentColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Space
                    const SizedBox(height: 15,),
                    //Booked
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const CustomText(
                              title: "Booked by:",
                              fontSize: 13,
                              color: greyColor,
                            ),
                          ),
                          //Space
                          const SizedBox(height: 4,),
                          //Double Deluxe Room
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CustomText(
                                    title: "Mr John Smith",
                                    fontSize: 15,
                                    color: blackColor,
                                  ),
                                  //Space
                                  const SizedBox(width: 3,),
                                  //
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: const BoxDecoration(
                                      color: greenColor,
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: Image.asset("assets/icons/ic_confirmed.png",
                                        color:whiteColor,scale: 2.4,),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "Group",
                                  fontSize: 15,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Space
                    const SizedBox(height: 15,),
                    //Guest Email:
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomText(
                                title: "Guest Email:",
                                fontSize: 13,
                                color: greyColor,
                              ),
                              CustomText(
                                title: "Guest Contact:",
                                fontSize: 13,
                                color: greyColor,
                              ),
                            ],
                          ),
                          //Space
                          const SizedBox(height: 4,),
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomText(
                                title: "johnsmith7@gmail.com",
                                fontSize: 15,
                                color: blackColor,
                              ),
                              CustomText(
                                title: "+2139247810",
                                fontSize: 15,
                                color: blackColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Space
                    const SizedBox(height: 15,),
                    //Adults:
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomText(
                                title: "Adults:",
                                fontSize: 13,
                                color: greyColor,
                              ),
                              CustomText(
                                title: "Childrens",
                                fontSize: 13,
                                color: greyColor,
                              ),
                            ],
                          ),
                          //Space
                          const SizedBox(height: 4,),
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomText(
                                title: "Two",
                                fontSize: 15,
                                color: blackColor,
                              ),
                              CustomText(
                                title: "Five",
                                fontSize: 15,
                                color: blackColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Space
                    const SizedBox(height: 15,),
                    //Guest City
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomText(
                                title: "Guest City",
                                fontSize: 13,
                                color: greyColor,
                              ),
                              CustomText(
                                title: "Guest Country",
                                fontSize: 13,
                                color: greyColor,
                              ),
                            ],
                          ),
                          //Space
                          const SizedBox(height: 4,),
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomText(
                                title: "Sydney",
                                fontSize: 15,
                                color: blackColor,
                              ),
                              CustomText(
                                title: "Australia",
                                fontSize: 15,
                                color: blackColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Space
                    const SizedBox(height: 15,),
                    //Arrival
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomText(
                                title: "Arrival",
                                fontSize: 13,
                                color: greyColor,
                              ),
                              CustomText(
                                title: "Departure",
                                fontSize: 13,
                                color: greyColor,
                              ),
                            ],
                          ),
                          //Space
                          const SizedBox(height: 4,),
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomText(
                                title: "Mar 16, 2021",
                                fontSize: 15,
                                color: blackColor,
                              ),
                              CustomText(
                                title: "Mar 20, 2021",
                                fontSize: 15,
                                color: blackColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Space
                    const SizedBox(height: 15,),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Space
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                  onPressed: () {
                 //   Helper.toScreen(context, ReservationDetailScreen());
                  },
                  btnHeight: 48,
                  btnRadius: 4,
                  title: "Modify",
                  fontWeight: FontWeight.w600,
                  btnColor: kPrimaryColor,
                  textColor: whiteColor,
                  fontSize: 18,
                ),
              ),
             //Space
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18,),
                child: CustomButton(
                  onPressed: () {
                      // Helper.toScreen(context, ReservationDetailScreen());
                  },
                  btnHeight: 48,
                  btnRadius: 4,
                  title: "Cancel",
                  fontWeight: FontWeight.w600,
                  btnColor: redColor,
                  textColor: whiteColor,
                  fontSize: 18,
                ),
              ),
              //Space
              const SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}
