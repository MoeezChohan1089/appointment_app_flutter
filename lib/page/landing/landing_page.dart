part of '../pages.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int? _isDokter = 1;

  late var size;
  var height;
  var width;

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 4.0),
            Image.asset(
              "assets/login.png",
              fit: BoxFit.cover,
              height: 250,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppTheme.dangerColor,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          "Welcome!",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Now it is easier for patients who want to consult with a doctor without having to leave home.",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Choose",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _isDokter,
                                  onChanged: (dynamic value) => setState(() {
                                    _isDokter = value;
                                  }),
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                ),
                                Text(
                                  'Patient',
                                  style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _isDokter,
                                  onChanged: (dynamic value) => setState(() {
                                    _isDokter = value;
                                  }),
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                ),
                                Text(
                                  'Doctor',
                                  style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Radio(
                            //       value: 3,
                            //       groupValue: _isDokter,
                            //       onChanged: (dynamic value) => setState(() {
                            //         _isDokter = value;
                            //       }),
                            //       fillColor: MaterialStateColor.resolveWith(
                            //               (states) => Colors.white),
                            //     ),
                            //     Text(
                            //       'Admin',
                            //       style:
                            //       TextStyle(fontSize: 12, color: Colors.white),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: Container(
                            height: height / 16,
                            width: width / 3,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LoginPage(isDokter: _isDokter),
                                  ),
                                );
                              },
                              child: Text(
                                "Continue",
                              ),
                              color: AppTheme.darkerPrimaryColor,
                              textColor: Colors.white,
                              disabledColor: Colors.grey.shade300,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
