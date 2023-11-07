part of '../pages.dart';

class EditQueue extends StatefulWidget {
  final Queue queue;
  const EditQueue({Key? key, required this.queue}) : super(key: key);

  @override
  _EditQueueState createState() => _EditQueueState();
}

class _EditQueueState extends State<EditQueue> {
  Queue get queue => widget.queue;

  bool _isLoading = false;

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtPhoneNumber = TextEditingController();
  TextEditingController _txtNumber = TextEditingController();

  FocusNode _fnName = FocusNode();
  FocusNode _fnPhoneNumber = FocusNode();
  FocusNode _fnNumber = FocusNode();

  @override
  void initState() {
    _txtName.text = queue.transactionData!.createdBy!.name!;
    _txtPhoneNumber.text = queue.transactionData!.createdBy!.phoneNumber!;
    _txtNumber.text = queue.queueNumber.toString();
    super.initState();
  }

  @override
  void dispose() {
    _txtName.dispose();
    _txtPhoneNumber.dispose();
    _txtNumber.dispose();

    _fnName.dispose();
    _fnPhoneNumber.dispose();
    _fnNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Toolbar(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Center(
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Edit Queue",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.dangerColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 18.0),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text("Name"),
                                const SizedBox(height: 4.0),
                                TextFormField(
                                  focusNode: _fnName,
                                  controller: _txtName,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                Text("Phone Number"),
                                const SizedBox(height: 4.0),
                                TextFormField(
                                  focusNode: _fnPhoneNumber,
                                  controller: _txtPhoneNumber,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                Text("Queue Number"),
                                const SizedBox(height: 4.0),
                                TextFormField(
                                  focusNode: _fnNumber,
                                  controller: _txtNumber,
                                  maxLength: 16,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'Queue Number',
                                    errorStyle: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'You must fill this field';
                                    }

                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).unfocus();
                                  },
                                ),
                                const SizedBox(height: 22.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    _isLoading
                                        ? CircularProgressIndicator()
                                        : MaterialButton(
                                            onPressed: () async {
                                              setState(() {
                                                _isLoading = true;
                                              });

                                              await _editQueue();

                                              setState(() {
                                                _isLoading = false;
                                              });

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      "Queue Number Updated"),
                                                ),
                                              );

                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Edit"),
                                            color: AppTheme.warningColor,
                                            textColor: Colors.black,
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.06,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _editQueue() async {
    int? queueNumber = int.tryParse(_txtNumber.text);
    if (queueNumber == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("0 is not valid Queue Number"),
        ),
      );
      return;
    }

    await Provider.of<QueueProvider>(context, listen: false).updateQueueNumber(
      doctorId: queue.transactionData!.doctorProfile!.uid,
      queueId: queue.docId,
      number: queueNumber,
    );
    await Provider.of<QueueProvider>(context, listen: false)
        .getAllQueue(queue.transactionData!.doctorProfile!.uid);
  }
}
