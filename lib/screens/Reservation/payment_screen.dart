import 'package:flutter/material.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_button.dart';
import 'package:pms/widgets/custom_text.dart';
import 'package:pms/widgets/custom_textfield.dart';
class PaymentScreen extends StatelessWidget {
   const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Space
                        const SizedBox(height: 20,),
                        //Reservation Type
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "Reservation Type",
                                  fontSize: 14,
                                  color: darkBlueColor,
                                  fontWeight: FontWeight.w600,
                                )
                            ),
                            //Space
                            const SizedBox(height: 8,),
                            //Single,Group
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
                                        title: "Group",
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
                        const SizedBox(height: 10,),
                        //Guest Name
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "Guest Name",
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
                                        // controller: monthController,
                                        keyboardType: TextInputType.text,
                                        onChanged: () {},
                                        hintText: "John Smith",
                                        hintTextColor: darkBlueColor,
                                        fieldborderRadius: 5,
                                        textFieldFillColor: whiteColor,
                                        fieldborderColor: greyColor,
                                        contentPaddingTop: 9,
                                        contentPaddingBottom: 9,
                                        suffixIcon:  Image.asset("assets/icons/ic_user.png",scale: 2.3,),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                        //Space
                        const SizedBox(height: 10,),
                        //Guest Email
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "Guest Email",
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
                                        // controller: monthController,
                                        keyboardType: TextInputType.text,
                                        onChanged: () {},
                                        hintText: "johnsmith7@gmail.com",
                                        hintTextColor: darkBlueColor,
                                        fieldborderRadius: 5,
                                        textFieldFillColor: whiteColor,
                                        fieldborderColor: greyColor,
                                        contentPaddingTop: 9,
                                        contentPaddingBottom: 9,
                                        suffixIcon:  Image.asset("assets/icons/ic_email.png",scale: 2.3,),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                        //Space
                        const SizedBox(height: 10,),
                        //Guest Contact
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "Guest Contact",
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
                                        // controller: monthController,
                                        keyboardType: TextInputType.text,
                                        onChanged: () {},
                                        hintText: "+2139247810",
                                        hintTextColor: darkBlueColor,
                                        fieldborderRadius: 5,
                                        textFieldFillColor: whiteColor,
                                        fieldborderColor: greyColor,
                                        contentPaddingTop: 9,
                                        contentPaddingBottom: 9,
                                        suffixIcon:  Image.asset("assets/icons/ic_phone.png",scale: 2.3,),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                        //Space
                        const SizedBox(height: 10,),
                        //Room Category
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
                                        title: "Deluxe",
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
                                        title: "Suite",
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
                        const SizedBox(height: 10,),
                        //Room No & Price
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "Room No & Price",
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
                                        // controller: monthController,
                                        keyboardType: TextInputType.text,
                                        onChanged: () {},
                                        hintText: "507",
                                        hintTextColor: darkBlueColor,
                                        fieldborderRadius: 5,
                                        textFieldFillColor: whiteColor,
                                        fieldborderColor: greyColor,
                                        contentPaddingTop: 9,
                                        contentPaddingBottom: 9,
                                        suffixIcon:  Image.asset("assets/icons/ic_key.png",scale: 2.3,),
                                      ),
                                    ),
                                    //Space
                                    const SizedBox(width: 12,),
                                    Expanded(
                                      child: CustomTextField(
                                        // controller: monthController,
                                        keyboardType: TextInputType.text,
                                        onChanged: () {},
                                        hintText: "Price",
                                        hintTextColor: greyColor,
                                        fieldborderRadius: 5,
                                        textFieldFillColor: whiteColor,
                                        fieldborderColor: greyColor,
                                        contentPaddingTop: 9,
                                        contentPaddingBottom: 9,
                                        suffixIcon:  Image.asset("assets/icons/ic_card.png",scale: 2.3,),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                        //Space
                        const SizedBox(height: 10,),
                        //Adults & Childrens
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "Adults & Childrens",
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
                                        // controller: monthController,
                                        keyboardType: TextInputType.text,
                                        onChanged: () {},
                                        hintText: "Adults",
                                        hintTextColor: darkBlueColor,
                                        fieldborderRadius: 5,
                                        textFieldFillColor: whiteColor,
                                        fieldborderColor: greyColor,
                                        contentPaddingTop: 9,
                                        contentPaddingBottom: 9,
                                        suffixIcon:  Image.asset("assets/icons/ic_users.png",scale: 2.3,),
                                      ),
                                    ),
                                    //Space
                                    const SizedBox(width: 12,),
                                    Expanded(
                                      child: CustomTextField(
                                        // controller: monthController,
                                        keyboardType: TextInputType.text,
                                        onChanged: () {},
                                        hintText: "Childrens",
                                        hintTextColor: darkBlueColor,
                                        fieldborderRadius: 5,
                                        textFieldFillColor: whiteColor,
                                        fieldborderColor: greyColor,
                                        contentPaddingTop: 9,
                                        contentPaddingBottom: 9,
                                        suffixIcon:  Image.asset("assets/icons/ic_child.png",scale: 2.3,),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                        //Space
                        const SizedBox(height: 10,),
                        //Arrival & Departure Date
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  title: "Arrival & Departure Date",
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
                                        // controller: monthController,
                                        keyboardType: TextInputType.text,
                                        onChanged: () {},
                                        hintText: "Arrival",
                                        hintTextColor: greyColor,
                                        fieldborderRadius: 5,
                                        textFieldFillColor: whiteColor,
                                        fieldborderColor: greyColor,
                                        contentPaddingTop: 9,
                                        contentPaddingBottom: 9,
                                        suffixIcon:  Image.asset("assets/icons/ic_calendar.png",scale: 2.3,),
                                      ),
                                    ),
                                    //Space
                                    const SizedBox(width: 12,),
                                    Expanded(
                                      child: CustomTextField(
                                        // controller: monthController,
                                        keyboardType: TextInputType.text,
                                        onChanged: () {},
                                        hintText: "Departure",
                                        hintTextColor: greyColor,
                                        fieldborderRadius: 5,
                                        textFieldFillColor: whiteColor,
                                        fieldborderColor: greyColor,
                                        contentPaddingTop: 9,
                                        contentPaddingBottom: 9,
                                        suffixIcon:  Image.asset("assets/icons/ic_calendar.png",scale: 2.3,),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                        //Space
                        const SizedBox(height: 20,),
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
                    title: "Next",
                    fontWeight: FontWeight.w600,
                    btnColor: kPrimaryColor,
                    textColor: whiteColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
