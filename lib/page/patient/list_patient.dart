part of '../pages.dart';

class ListPasien extends StatefulWidget {
  @override
  _ListPasienState createState() => _ListPasienState();
}

class _ListPasienState extends State<ListPasien> {
  bool _isLoading = false;

  @override
  void initState() {
    Provider.of<PatientProvider>(context, listen: false).getAllPatient(
      Provider.of<DoctorProvider>(context, listen: false).doctor!.uid,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PatientProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (value.listAllPatient.isEmpty) {
            return Center(
              child: Text("You don't have any patient yet"),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Toolbar(),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "List Patient",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _isLoading
                        ? CircularProgressIndicator()
                        : MaterialButton(
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });

                              // await _downloadData(value.listAllPatient);

                              setState(() {
                                _isLoading = false;
                              });
                            },
                            color: AppTheme.dangerColor,
                            textColor: Colors.white,
                            child: Text("Download List"),
                            shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                          ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.listAllPatient.length,
                    itemBuilder: (context, index) {
                      final item = value.listAllPatient[index];

                      return _patientCard(item);
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

  _downloadData(List<UserModel> data) async {
    var status = await Permission.storage.status;
    // Checking storage permission, if not granted will be requested
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat:
            PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          return pw.Container(
            alignment: pw.Alignment.center,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            child:
                pw.Text('Patient Report', style: pw.Theme.of(context).header3),
          );
        },
        build: (pw.Context context) => <pw.Widget>[
          pw.Table.fromTextArray(
              context: context,
              border: pw.TableBorder.all(),
              headers: <String>[
                'No',
                'Name',
                'Email',
                'Address',
                'Phone Number',
              ],
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex('#FFF'),
              ),
              headerDecoration: pw.BoxDecoration(
                color: PdfColor.fromInt(AppTheme.primarydanger),
              ),
              headerAlignment: pw.Alignment.centerLeft,
              data: <List<String>>[
                for (int i = 0; i < data.length; i++)
                  <String>[
                    '${i + 1}',
                    '${data[i].name}',
                    '${data[i].email}',
                    '${data[i].address}',
                    '${data[i].phoneNumber}',
                  ],
              ]),
          pw.Paragraph(text: ""),
          pw.Paragraph(
              text: "Total Patient : ${data.length}",
              textAlign: pw.TextAlign.right),
          pw.Padding(padding: const pw.EdgeInsets.all(10)),
        ],
      ),
    );

    // Get ApplicationDocumentsDirectory
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;

    // Filename and path
    final file = File("$path/patient_report${DateTime.now().toString()}.pdf");

    // Saving file as pdf
    await file.writeAsBytes(await pdf.save()).whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Downloaded at ${file.path}"),
              duration: Duration(seconds: 5),
              action: SnackBarAction(
                label: "Open",
                onPressed: () async => await OpenFile.open(file.path),
              ),
            ),
          ),
        );
  }

  _patientCard(UserModel item) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey,
              backgroundImage:
                  item.profileUrl != "" ? NetworkImage(item.profileUrl!) : null,
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
            title: Text("${item.name}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Address: ${item.address}"),
                Text("Phone Number: ${item.phoneNumber}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
