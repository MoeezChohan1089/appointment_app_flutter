import 'package:flutter/material.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/widgets/custom_card.dart';
import 'package:pms/widgets/custom_inkwell_btn.dart';
import 'package:pms/widgets/custom_model_bottom_sheet.dart';
import 'package:pms/widgets/custom_text.dart';
class BookingScreen extends StatelessWidget {
   const BookingScreen({Key? key}) : super(key: key);

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
          title: "Booking",
          fontSize: 17,
          color: whiteColor,
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Image.asset("assets/icons/ic_search.png",scale: 2,)),
          IconButton(
              onPressed: (){
                filterBottomSheet(context);
              },
              icon: Image.asset("assets/icons/ic_filter.png",scale: 2,))
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              //Space
              const SizedBox(height: 20,),
              //
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.arrow_back_ios_outlined,size: 18,color: greyIconColor,),
                    CustomText(
                      title: "March 2021",
                      fontSize: 17,
                      color: mediumPurpleColor,
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,size: 18,color: greyIconColor,),
                  ],
                ),
              ),
              //Space
              const SizedBox(height: 20,),
              //March 01
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                alignment: Alignment.centerLeft,
                child: const CustomText(
                  title: "March 01",
                  fontSize: 16,
                  color: mediumPurpleColor2,
                ),
              ),
              //Space
              const SizedBox(height: 5,),
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

          Positioned.directional(
            textDirection: Directionality.of(context),
            end: 20,
            bottom: 40,
            child: CustomInkWell(
              onTap: (){},
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27.5)
                ),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                 width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle
                    ),
                    child: Image.asset("assets/icons/ic_add.png",scale: 2.2,)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void filterBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        context: context, builder: (context){
      return    CustomModelBottomSheet();
    });
  }
}
