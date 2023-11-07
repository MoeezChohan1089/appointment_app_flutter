part of '../pages.dart';

class ListDiagnosisUser extends StatefulWidget {
  const ListDiagnosisUser({Key? key}) : super(key: key);

  @override
  _ListDiagnosisUserState createState() => _ListDiagnosisUserState();
}

class _ListDiagnosisUserState extends State<ListDiagnosisUser> {
  @override
  void initState() {
    Provider.of<DiagnosisProvider>(context, listen: false).getAllDiagnosis(
      Provider.of<UserProvider>(context, listen: false).user!.uid,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DiagnosisProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (value.listDiagnosis.isEmpty) {
            return Center(
              child: Text("There's no report from provider"),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Toolbar(),
                const SizedBox(height: 16.0),
                Text(
                  "List Services",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.listDiagnosis.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = value.listDiagnosis[index];

                      return _diagnosisCard(context, item);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _diagnosisCard(BuildContext context, Diagnosis item) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Service Provider : ${item.queueData!.transactionData!.doctorProfile!.name}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${DateFormat("dd MMMM yyyy").format(item.createdAt)}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profession : ",
                ),
                Text(
                  "${item.queueData!.transactionData!.doctorProfile!.specialist}",
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Consultation Time : ",
                ),
                Text(
                  "${item.queueData!.transactionData!.consultationSchedule!.startAt!.format(context)} - ${item.queueData!.transactionData!.consultationSchedule!.endAt!.format(context)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Service : ",
                ),
                Text("${item.diagnosis}")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
