part of '../pages.dart';

class AddConsultationSchedule extends StatefulWidget {
  const AddConsultationSchedule({Key? key}) : super(key: key);

  @override
  _AddConsultationScheduleState createState() =>
      _AddConsultationScheduleState();
}

class _AddConsultationScheduleState extends State<AddConsultationSchedule> {
  List<DaySchedule> _day = [
    DaySchedule(
      'Monday',
      1,
    ),
    DaySchedule(
      'Tuesday',
      2,
    ),
    DaySchedule(
      'Wednesday',
      3,
    ),
    DaySchedule(
      'Thursday',
      4,
    ),
    DaySchedule(
      'Friday',
      5,
    ),
    DaySchedule(
      'Saturday',
      6,
    ),
    DaySchedule(
      'Sunday',
      7,
    ),
  ];

  DaySchedule? _selectedDay;

  TimeOfDay? _startTime;
  late TimeOfDay _endTime;

  TextEditingController _txtPrice = TextEditingController();
  FocusNode _fnPrice = FocusNode();

  bool _isLoading = false;

  _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _startTime = pickedTime;
        pickedTime.minute >= 30
            ? _endTime = pickedTime.replacing(
                hour: pickedTime.hour + 1,
                minute: pickedTime.minute - 30,
              )
            : _endTime = pickedTime.replacing(
                hour: pickedTime.hour,
                minute: pickedTime.minute + 30,
              );
      });
    }
  }

  @override
  void initState() {
    _selectedDay = _day.firstWhere((element) => element.intValue == 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Toolbar(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Center(
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Add Consultation Schedule",
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
                                Text("Pick day"),
                                const SizedBox(height: 4.0),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    child: DropdownButton<DaySchedule>(
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      value: _selectedDay,
                                      items: generateItems(_day),
                                      onChanged: (item) {
                                        setState(() {
                                          _selectedDay = item;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                Text("Time"),
                                const SizedBox(height: 4.0),
                                MaterialButton(
                                  color: AppTheme.darkerPrimaryColor,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  onPressed: () async =>
                                      await _selectTime(context),
                                  child: _startTime != null
                                      ? Text(
                                          "${_startTime!.format(context)} - ${_endTime.format(context)}")
                                      : Text("Pick Time"),
                                ),
                                const SizedBox(height: 12.0),
                                Text("Price"),
                                const SizedBox(height: 4.0),
                                TextFormField(
                                  focusNode: _fnPrice,
                                  controller: _txtPrice,
                                  maxLength: 16,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    NumericTextFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'Price',
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
                                        ? CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          )
                                        : MaterialButton(
                                            onPressed: () async {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              await _addJadwal();
                                              setState(() {
                                                _isLoading = false;
                                              });
                                            },
                                            child: Text("Add Schedule"),
                                            color:
                                                AppTheme.darkerPrimaryColor,
                                            textColor: Colors.white,
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

  List<DropdownMenuItem<DaySchedule>> generateItems(List<DaySchedule> days) {
    List<DropdownMenuItem<DaySchedule>> items = [];
    for (var day in days) {
      items.add(
        DropdownMenuItem(
          child: Text("${day.day}"),
          value: day,
        ),
      );
    }
    return items;
  }

  _addJadwal() async {
    NumberFormat format = NumberFormat();

    if (_startTime == null || _txtPrice.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You must fill all value"),
        ),
      );
      return;
    }

    DateTime now = DateTime.now();

    // Assign TimeOfDay to DateTime
    DateTime startAt = DateTime(
        now.year, now.month, now.day, _startTime!.hour, _startTime!.minute);

    DateTime endAt =
        DateTime(now.year, now.month, now.day, _endTime.hour, _endTime.minute);

    Map<String, dynamic> data = {
      'day_schedule': _selectedDay!.toJson(),
      // Format the value to 00:00 PM, so we can get the data later as TimeOfDay
      'start_at': DateFormat("hh:mm a").format(startAt),
      'end_at': DateFormat("hh:mm a").format(endAt),
      // Parse the price, removing , (coma)
      'price': format.parse(_txtPrice.text),
    };

    try {
      await Provider.of<ConsultationScheduleProvider>(context, listen: false)
          .addConsultationSchedule(
        data,
        Provider.of<DoctorProvider>(context, listen: false).doctor!.uid,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Success adding new constulation schedule"),
        ),
      );

      Navigator.of(context).pop();
    } catch (e) {
      print("Something went wrong:" + e.toString());
    }
  }
}
