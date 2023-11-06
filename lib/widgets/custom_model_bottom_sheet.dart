import 'package:flutter/material.dart';
import 'package:pms/utilites/constants.dart';
import 'custom_button.dart';
import 'custom_text.dart';
import 'custom_textfield.dart';

class CustomModelBottomSheet extends StatelessWidget {
   CustomModelBottomSheet({Key? key}) : super(key: key);
   final monthController = TextEditingController();
   final yearController = TextEditingController();
   final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.8,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  //Space
                  const SizedBox(height: 30,),
                  //Filters
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.center,
                    child: const CustomText(
                      title: "Filters",
                      fontSize: 16,
                      color: darkBlueColor,
                      fontWeight: FontWeight.w700,
                    )
                  ),

                  //Space
                  const SizedBox(height: 20,),
                  //Month & Year
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Month & Year",
                            fontSize: 14,
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                      //Space
                      const SizedBox(height: 8,),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.center,
                          height: 45,
                          child:Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: monthController,
                                  keyboardType: TextInputType.text,
                                  onChanged: () {},
                                  hintText: "April",
                                  hintTextColor: darkBlueColor,
                                  fieldborderRadius: 5,
                                  textFieldFillColor: whiteColor,
                                  fieldborderColor: greyColor,
                                  contentPaddingTop: 9,
                                  contentPaddingBottom: 9,
                                  suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp,color: greyColor,),
                                ),
                              ),
                              //Space
                              const SizedBox(width: 12,),
                              Expanded(
                                child: CustomTextField(
                                  controller: monthController,
                                  keyboardType: TextInputType.text,
                                  onChanged: () {},
                                  hintText: "2021",
                                  hintTextColor: darkBlueColor,
                                  fieldborderRadius: 5,
                                  textFieldFillColor: whiteColor,
                                  fieldborderColor: greyColor,
                                  contentPaddingTop: 9,
                                  contentPaddingBottom: 9,
                                  suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp,color: greyColor,),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  //Space
                  const SizedBox(height: 20,),
                  //Room Categories
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Room Categories",
                            fontSize: 14,
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                      //Space
                      const SizedBox(height: 8,),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.center,
                          height: 44,
                          child:Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Standard",
                                  fontWeight: FontWeight.w600,
                                  btnColor: kPrimaryColor,
                                  textColor: whiteColor,
                                  fontSize: 14,
                                ),
                              ),
                              //Space
                              const SizedBox(width: 12,),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Deluxe",
                                  fontWeight: FontWeight.w600,
                                  btnColor: kPrimaryColor,
                                  textColor: whiteColor,
                                  fontSize: 14,
                                ),
                              ),
                              //Space
                              const SizedBox(width: 12,),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Suite",
                                  fontWeight: FontWeight.w600,
                                  btnColor: kPrimaryColor,
                                  textColor: whiteColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  //Space
                  const SizedBox(height: 20,),
                  //Room Types
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Room Types",
                            fontSize: 14,
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                      //Space
                      const SizedBox(height: 8,),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.center,
                          height: 44,
                          child:Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Single",
                                  fontWeight: FontWeight.w600,
                                  btnColor: mediumGreyColor,
                                  textColor: mediumBlackColor,
                                  fontSize: 14,
                                ),
                              ),
                              //Space
                              const SizedBox(width: 12,),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Double",
                                  fontWeight: FontWeight.w600,
                                  btnColor: mediumGreyColor,
                                  textColor: mediumBlackColor,
                                  fontSize: 14,
                                ),
                              ),
                              //Space
                              const SizedBox(width: 12,),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Cabana",
                                  fontWeight: FontWeight.w600,
                                  btnColor: mediumGreyColor,
                                  textColor: mediumBlackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  //Space
                  const SizedBox(height: 20,),
                  //Payment Status
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Payment Status",
                            fontSize: 14,
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                      //Space
                      const SizedBox(height: 8,),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.center,
                          height: 44,
                          child:Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Paid",
                                  fontWeight: FontWeight.w600,
                                  btnColor: mediumColor,
                                  textColor: mediumBlackColor,
                                  fontSize: 14,
                                ),
                              ),
                              //Space
                              const SizedBox(width: 12,),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Unpaid",
                                  fontWeight: FontWeight.w600,
                                  btnColor: mediumColor,
                                  textColor: mediumBlackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                  //Space
                  const SizedBox(height: 20,),
                  //Booking Status
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.centerLeft,
                          child: const CustomText(
                            title: "Booking Status",
                            fontSize: 14,
                            color: darkBlueColor,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                      //Space
                      const SizedBox(height: 8,),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.center,
                          height: 44,
                          child:Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Confirmed",
                                  fontWeight: FontWeight.w600,
                                  btnColor: kPrimaryColor,
                                  textColor: whiteColor,
                                  fontSize: 14,
                                ),
                              ),
                              //Space
                              const SizedBox(width: 12,),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                  },
                                  btnHeight: 40,
                                  btnRadius: 4,
                                  title: "Pending",
                                  fontWeight: FontWeight.w600,
                                  btnColor: mediumGreyColor,
                                  textColor: mediumBlackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
            child: CustomButton(
              onPressed: () {
                //  Helper.toScreen(context, PickingScreen());
              },
              btnHeight: 48,
              btnRadius: 4,
              title: "Filter",
              fontWeight: FontWeight.w600,
              btnColor: kPrimaryColor,
              textColor: whiteColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

