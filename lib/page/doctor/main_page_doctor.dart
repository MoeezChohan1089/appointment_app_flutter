part of '../pages.dart';

class MainPageDoctor extends StatefulWidget {
  @override
  _MainPageDoctorState createState() => _MainPageDoctorState();
}

class _MainPageDoctorState extends State<MainPageDoctor> {
  late var size;
  var height;
  var width;

  var currentUser;
  @override
  void initState() {
    Provider.of<QueueProvider>(context, listen: false).get7Queue(
        Provider.of<DoctorProvider>(context, listen: false).doctor!.uid);
    Provider.of<PatientProvider>(context, listen: false).get7Patient(
        Provider.of<DoctorProvider>(context, listen: false).doctor!.uid!);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    currentUser = Provider.of<DoctorProvider>(context).doctor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                size: 16,
                              ),
                            ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Work orders today",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 8,
                ),
                Consumer<QueueProvider>(
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (value.listQueue.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("There's no work order today"),
                      );
                    }

                    return Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.listQueue.length,
                        itemBuilder: (context, index) {
                          final item = value.listQueue[index];

                          return _queueCard(item);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "List Clients",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 8,
                ),
                Consumer<PatientProvider>(
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (value.patient.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("You have no client yet"),
                      );
                    }

                    return Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.patient.length,
                        itemBuilder: (context, index) {
                          final item = value.patient[index];

                          return _patientCard(item);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Manage",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  elevation: 4.0,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddConsultationSchedule(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.dangerColor,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                    title: Text("Add schedule"),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ListConsultationSchedule(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.dangerColor,
                      child: Icon(Icons.date_range, color: Colors.white),
                    ),
                    title: Text("Schedule list"),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ListPasien(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.dangerColor,
                      child: Icon(Icons.assignment_ind, color: Colors.white),
                    ),
                    title: Text("Client list"),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ListDoctorQueue()),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.dangerColor,
                      child: Icon(Icons.assignment, color: Colors.white),
                    ),
                    title: Text("Queue list"),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => PaymentList()),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.dangerColor,
                      child: Icon(Icons.account_balance_rounded, color: Colors.white),
                    ),
                    title: Text("Add Configure/Payment Method"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _patientCard(UserModel item) {
    return Container(
      width: 160,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey,
                  backgroundImage: item.profileUrl != ""
                      ? NetworkImage(item.profileUrl!)
                      : null,
                  child: item.profileUrl != ""
                      ? null
                      : Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${item.name}",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _queueCard(Queue item) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, right: 5),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.grey,
                backgroundImage: item.transactionData!.createdBy!.profileUrl !=
                        ""
                    ? NetworkImage(item.transactionData!.createdBy!.profileUrl!)
                    : null,
                child: item.transactionData!.createdBy!.profileUrl != ""
                    ? null
                    : Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.transactionData!.createdBy!.name}",
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\$${NumberFormat("#,###").format(item.transactionData!.consultationSchedule!.price)}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryColor,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "${item.transactionData!.consultationSchedule!.startAt!.format(context)} - ${item.transactionData!.consultationSchedule!.endAt!.format(context)}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ConsultationPage(
                          queue: item,
                        ),
                      ),
                    );
                  },
                  color: AppTheme.dangerColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text("Start consultation"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
