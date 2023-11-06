import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pms/services/dashboard_service.dart';
import 'package:provider/provider.dart';
import 'provider/main_provider.dart';
import 'screens/splash/splash.dart';
import 'utilites/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // DashboardService.getDashboardData();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: kPrimaryColor, // Color for Android
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness:
            Brightness.dark, // Dark == white status bar -- for IOS.
        systemNavigationBarColor: whiteColor,
        systemNavigationBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ChangeNotifierProvider<MainProvider>(
        create: (context) => MainProvider(),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "PMS EXPRESS",
              home: const Splash(),
              theme: ThemeData(
                  scaffoldBackgroundColor: scaffoldBackgroundColor,
                  canvasColor: scaffoldBackgroundColor,
                  primaryColor: kPrimaryColor,
                  primarySwatch: primarySwatch,
                  fontFamily: 'medium',
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashFactory: InkRipple.splashFactory,
                  focusColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: kPrimaryColor)),
            ));
  }
}
