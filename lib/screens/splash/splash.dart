
import 'package:flutter/material.dart';
import 'package:pms/screens/Account/login_screen.dart';
import 'package:pms/screens/HomePage/home_page.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/utilites/helper.dart';
import 'package:pms/widgets/custom_parent_widget.dart';
import 'package:pms/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void init() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Future.delayed(const Duration(seconds: 3),(){
        if (prefs.getInt("uid") == null) {
          Helper.toRemoveUntiScreen(context, LoginScreen());
        } else {
          Helper.toRemoveUntiScreen(context, const HomePage());
        }
      });
    } catch (e) {
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues({});
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: Scaffold(
        backgroundColor: blackColor2,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/ic_app.png",scale: 30,),
            //Space
            const SizedBox(height: 8,),
            const Center(
              child: CustomText(
                title: "Manage all records from here",
                fontSize: 12,
                color: greenAccentColor,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
