import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pms/screens/Account/login_screen.dart';
import 'package:pms/screens/Arrival/arrival_list_screen.dart';
import 'package:pms/screens/HomePage/dashboard_screen.dart';
import 'package:pms/screens/Reservation/reservation_screen.dart';
import 'package:pms/services/auth_services.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/utilites/helper.dart';
import 'package:pms/widgets/custom_inkwell_btn.dart';
import 'package:pms/widgets/custom_text.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final List<String> menuItems = ["Dashboard", "Arrival", "Departure", "Reservation"];
  final List<String> menuIcons = ["icon_home", "icon_blogger", "icon_add", "icon_settings"];

  bool sidebarOpen = false;

  double yOffset = 0;
  double xOffset = 0;
  double pageScale = 1;

  int selectedMenuItem = 0;

  String pageTitle = "Dashboard";

  void setSidebarState() {
    setState(() {
      xOffset = sidebarOpen ? 265 : 0;
      yOffset = sidebarOpen ? 0 : 0;
      pageScale = sidebarOpen ? 0.8 : 1;
    });
  }

  void setPageTitle() {
    switch(selectedMenuItem) {
      case 0:
        pageTitle = "Dashboard";
        break;
      case 1:
        pageTitle = "Arrival";
        break;
      case 2:
        pageTitle = "Departure";
        break;
      case 3:
        pageTitle = "Reservation";
        break;
    }
  }


  userLogout()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("uid") != null){
     // prefs.setInt("uid",null);
      prefs.clear();
     Helper.toRemoveUntiScreen(context, LoginScreen());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onHorizontalDragStart: (_){
            setState(() {
              sidebarOpen = false;
           //   selectedMenuItem = index;
               setSidebarState();
           //    setPageTitle();
            });
          },
          child: Container(
            width: double.infinity,
            color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //Space
                const SizedBox(height: 50,),
                Expanded(
                    child: ListView.builder(
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            sidebarOpen = false;
                            selectedMenuItem = index;
                            setSidebarState();
                            setPageTitle();
                          },
                          child: MenuItem(
                            itemIcon: menuIcons[index],
                            itemText: menuItems[index],
                            selected: selectedMenuItem,
                            position: index,
                          ),
                        )
                    )
                ),
                CustomInkWell(
                  onTap: (){
                    AuthServices().callApiSignOut();
                    userLogout();
                  },
                  child: MenuItem(
                    itemIcon: "icon_logout",
                    itemText: "Logout",
                    selected: selectedMenuItem,
                    position: menuItems.length + 1,
                  ),
                )
              ],
            ),
          ),
        ),
        Builder(
            builder: (context) {
              if(pageTitle == "Dashboard"){
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(xOffset, yOffset, 1.0)..scale(pageScale),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: sidebarOpen ? BorderRadius.circular(20) : BorderRadius.circular(0)
                  ),
                  child:Scaffold(
                    backgroundColor: mediumGreyColor,
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: kPrimaryColor,
                      centerTitle: false,
                      leading: IconButton(
                          onPressed: () {
                            // mainDrawerKey.currentState!.openDrawer();
                            sidebarOpen = !sidebarOpen;
                            setSidebarState();
                          },
                          icon: Image.asset(
                            "assets/icons/ic_menu.png", scale: 2.3,)),
                      title: const CustomText(
                        title: "Dashboard",
                        fontSize: 17,
                        color: whiteColor,
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icons/ic_add.png", scale: 2.3,))
                      ],
                    ),
                    body: const DashBoardScreen(),
                  ),
                );
              }else if(pageTitle == "Arrival"){
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(xOffset, yOffset, 1.0)..scale(pageScale),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: sidebarOpen ? BorderRadius.circular(20) : BorderRadius.circular(0)
                  ),
                  child:Scaffold(
                    backgroundColor: mediumGreyColor,
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: kPrimaryColor,
                      centerTitle: false,
                      leading: IconButton(
                          onPressed: () {
                            // mainDrawerKey.currentState!.openDrawer();
                            sidebarOpen = !sidebarOpen;
                            setSidebarState();
                          },
                          icon: Image.asset(
                            "assets/icons/ic_menu.png", scale: 2.3,)),
                      title: const CustomText(
                        title: "Arrival List",
                        fontSize: 17,
                        color: whiteColor,
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icons/ic_add.png", scale: 2.3,))
                      ],
                    ),
                    body: const ArrivalListScreen(),
                  ),
                );
              }else if(pageTitle == "Reservation"){
                return AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(xOffset, yOffset, 1.0)..scale(pageScale),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: sidebarOpen ? BorderRadius.circular(20) : BorderRadius.circular(0)
                  ),
                  child:Scaffold(
                    backgroundColor: mediumGreyColor,
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: kPrimaryColor,
                      centerTitle: false,
                      leading: IconButton(
                          onPressed: () {
                            // mainDrawerKey.currentState!.openDrawer();
                            sidebarOpen = !sidebarOpen;
                            setSidebarState();
                          },
                          icon: Image.asset(
                            "assets/icons/ic_menu.png", scale: 2.3,)),
                      title: const CustomText(
                        title: "Add Reservation",
                        fontSize: 17,
                        color: whiteColor,
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/icons/ic_add.png", scale: 2.3,))
                      ],
                    ),
                    body: const ReservationScreen(),
                  ),
                );
              }
              return AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(xOffset, yOffset, 1.0)..scale(pageScale),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: sidebarOpen ? BorderRadius.circular(20) : BorderRadius.circular(0)
                ),
                child:Scaffold(
                  backgroundColor: mediumGreyColor,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: kPrimaryColor,
                    centerTitle: false,
                    leading: IconButton(
                        onPressed: () {
                          // mainDrawerKey.currentState!.openDrawer();
                          sidebarOpen = !sidebarOpen;
                          setSidebarState();
                        },
                        icon: Image.asset(
                          "assets/icons/ic_menu.png", scale: 2.3,)),
                    title: const CustomText(
                      title: "Dashboard",
                      fontSize: 17,
                      color: whiteColor,
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/ic_add.png", scale: 2.3,))
                    ],
                  ),
                  body: const DashBoardScreen(),
                ),
              );
            }
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String? itemText;
  final String? itemIcon;
  final int? selected;
  final int? position;
  const MenuItem({
    Key? key,
    this.itemText,
    this.itemIcon,
    this.selected,
    this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == position ? const Color(0xffb151e26) : const Color(0xffb1f2b36),
      child: Row(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/images/$itemIcon.png")
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              itemText!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }
}


