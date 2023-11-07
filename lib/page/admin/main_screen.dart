part of '../pages.dart';

class MainAdminPage extends StatefulWidget {
  @override
  _MainPageAdminState createState() => _MainPageAdminState();
}

class _MainPageAdminState extends State<MainAdminPage> {
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
                Center(
                  child: Text("This is the Admin Page"),
                )

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
