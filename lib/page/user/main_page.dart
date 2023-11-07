part of '../pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late var size;
  var height;
  var width;

  var currentUser;

  @override
  void initState() {
    Provider.of<DoctorProvider>(context, listen: false).getAllDoctor(
        Provider.of<UserProvider>(context, listen: false).user!.uid);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    currentUser = Provider.of<UserProvider>(context).user;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Hello, ${currentUser.name}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(width: 24),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey,
                      backgroundImage: currentUser.profileUrl != ""
                          ? NetworkImage(currentUser.profileUrl)
                          : null,
                      child: currentUser.profileUrl != ""
                          ? null
                          : Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                    ),
                  ],
                ),
                Image.asset("assets/service.png"),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Schedule Today",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Consumer<DoctorProvider>(
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (value.listDoctor.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("There's no available today"),
                      );
                    }

                    return Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: value.listDoctor.length,
                        itemBuilder: (context, index) {
                          final item = value.listDoctor[index];
                    //      final item1 = value.listTransaction[index];
                          final itemKonsultasi = item.consultationSchedule
                              .where((element) =>
                                  element.daySchedule!.intValue ==
                                  DateTime.now().weekday)
                              .first;

                          return _doctorCard(item, itemKonsultasi, context);
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Professionals",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 650,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _buildDoctorSpecialist(
                              specialist: "HR Specialist",
                              imgAsset: 'assets/hr.png',
                            ),
                            _buildDoctorSpecialist(
                              specialist: "Lawyer",
                              imgAsset: 'assets/lawyer.png',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _buildDoctorSpecialist(
                              specialist: "Doctor",
                              imgAsset: 'assets/doctor.png',
                            ),
                            _buildDoctorSpecialist(
                              specialist: "Epidemiologist",
                              imgAsset: 'assets/epidemiologist.png',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _buildDoctorSpecialist(
                              specialist: "Software Developer",
                              imgAsset: 'assets/developer.png',
                            ),
                            _buildDoctorSpecialist(
                              specialist: "Pharmist",
                              imgAsset: 'assets/pharmist.png',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _buildDoctorSpecialist(
                              specialist: "Computer Analyst",
                              imgAsset: 'assets/analyst.png',
                            ),
                            _buildDoctorSpecialist(
                              specialist: "Interpreter",
                              imgAsset: 'assets/interpreter.png',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _buildDoctorSpecialist(
                              specialist: "Therapist",
                              imgAsset: 'assets/therapist.png',
                            ),
                            _buildDoctorSpecialist(
                              specialist: "Market Research Analyst",
                              imgAsset: 'assets/market.png',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 4.0,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ListDiagnosisUser(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.dangerColor,
                      child: Icon(Icons.receipt, color: Colors.white),
                    ),
                    title: Text("Work Reports"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _doctorCard(DataDoctor item, ConsultationSchedule itemKonsultasi,
      BuildContext context) {
    return Container(
      height: 146,
      margin: EdgeInsets.only(bottom: 10, right: 8),
      child: Card(
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 8,
            ),
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.grey,
              backgroundImage: item.doctor.profileUrl != ""
                  ? NetworkImage(item.doctor.profileUrl!)
                  : null,
              child: item.doctor.profileUrl != ""
                  ? null
                  : Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
            ),
            Container(
              margin: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${item.doctor.name}"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${item.doctor.specialist}",
                    style: TextStyle(
                        color: AppTheme.dangerColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$${NumberFormat("#,###").format(itemKonsultasi.price)}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  item.doctor.isBusy!
                      ? Container(
                          height: 25,
                          width: 121,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppTheme.warningColor,
                          ),
                          child: Center(
                            child: Text(
                              "Consulting",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                        )
                      // : item.isBooked
                      //     ? Container(
                      //         height: 25,
                      //         width: 121,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(8),
                      //           color: AppTheme.dangerColor,
                      //         ),
                      //         child: Center(
                      //           child: Text(
                      //             "BOOKED",
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.w900,
                      //                 color: Colors.white),
                      //           ),
                      //         ),
                      //       )
                       : item.isBooked
                          ? Container(
                    height: 25,
                    width: 121,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppTheme.dangerColor,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ConsultationDetail(dataDoctor: item)
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          "Pending",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                          : Container(
                              height: 25,
                              width: 121,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppTheme.dangerColor,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ConsultationDetail(
                                        dataDoctor: item,
                                      ),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    "BOOK",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDoctorSpecialist(
      {required String specialist, required String imgAsset}) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 142,
      height: 110,
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ListDoctorSpecialist(specialist: "$specialist"),
            ));
          },
          child: Column(
            children: [
              Image.asset(
                "$imgAsset",
                height: 73,
                width: 68,
              ),
              Text(
                "$specialist",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
