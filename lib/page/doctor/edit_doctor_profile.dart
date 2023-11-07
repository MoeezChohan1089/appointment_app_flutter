part of '../pages.dart';

class EditDoctorProfile extends StatefulWidget {
  final Doctor? doctor;
  const EditDoctorProfile({Key? key, required this.doctor}) : super(key: key);

  @override
  _EditDoctorProfileState createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {
  Doctor? get doctor => widget.doctor;

  bool _isLoading = false;
  bool viewVisible = false;

  int? _radioValue = 0;

  int? _radiovalue2 = 1;
  String _genderValue = 'Male';
  String _chooseValue = 'Place';

  String? selectedSpecialist = "HR Specialist";
  List<String> specialist = [
    "HR Specialist",
    "Lawyer",
    "Doctor",
    "Epidemiologist",
    "Software Developer",
    "Pharmist",
    "Computer Analyst",
    "Interpreter",
    "Therapist",
    "Market Research Analyst",
  ];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtAddress = TextEditingController();
  TextEditingController _txtPhoneNumber = TextEditingController();
  TextEditingController _txtBankAccount = TextEditingController();

  FocusNode _fnName = FocusNode();
  FocusNode _fnEmail = FocusNode();
  FocusNode _fnAddress = FocusNode();
  FocusNode _fnPhoneNumber = FocusNode();
  FocusNode _fnBankAccount = FocusNode();

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;
    });
    switch (_radioValue) {
      case 0:
        _genderValue = 'Male';
        break;
      case 1:
        _genderValue = 'Female';
        break;
    }
  }

  void showWidget(int? valuee){
    setState(() {
      viewVisible = true;
      _radiovalue2 = valuee;
    });
    switch (_radiovalue2) {
      case 0:
        _chooseValue = 'Work from my location';
        break;
      case 1:
        _chooseValue = 'Work from your place';
        break;
      case 2:
        _chooseValue = 'Work online';
        break;
    }
  }

  void hideWidget(int? valuee){
    setState(() {
      viewVisible = false;
      _radiovalue2 = valuee;
    });
    switch (_radiovalue2) {
      case 0:
        _chooseValue = 'Work from my location';
        break;
      case 1:
        _chooseValue = 'Work from your place';
        break;
      case 2:
        _chooseValue = 'Work online';
        break;
    }
  }

  List<DropdownMenuItem> generateItems(List<String> spesialis) {
    List<DropdownMenuItem> items = [];
    for (var item in spesialis) {
      items.add(
        DropdownMenuItem(
          child: Text("$item"),
          value: item,
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    _txtName.text = doctor!.name!;
    _txtEmail.text = doctor!.email!;
    _txtPhoneNumber.text = doctor!.phoneNumber!;
    _txtBankAccount.text = doctor!.bankAccount!;
    _txtAddress.text = doctor!.address!;
    _radiovalue2 = doctor!.choose == 'Place' ? 0 : 2;
    _chooseValue = doctor!.choose!;
    selectedSpecialist = doctor!.specialist;
    _radioValue = doctor!.gender == 'Male' ? 0 : 1;
    _genderValue = doctor!.gender!;
    super.initState();
  }

  @override
  void dispose() {
    _txtName.dispose();
    _txtEmail.dispose();
    _txtAddress.dispose();
    _txtPhoneNumber.dispose();
    _txtBankAccount.dispose();

    _fnName.dispose();
    _fnEmail.dispose();
    _fnAddress.dispose();
    _fnPhoneNumber.dispose();
    _fnBankAccount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
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
                                  "Edit Profile",
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 18.0),
                              child: DefaultTextStyle(
                                style: TextStyle(color: Colors.white),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Full Name",
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                      keyboardType: TextInputType.name,
                                      controller: _txtName,
                                      focusNode: _fnName,
                                      maxLength: 30,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        filled: true,
                                        counterText: "",
                                        fillColor: Colors.white,
                                        hintText: 'Full Name',
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
                                        FocusScope.of(context)
                                            .requestFocus(_fnEmail);
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Email",
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _txtEmail,
                                      focusNode: _fnEmail,
                                      readOnly: true,
                                      maxLength: 30,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        filled: true,
                                        counterText: "",
                                        fillColor: Colors.white,
                                        hintText: 'example@gmail.com',
                                        errorStyle: TextStyle(
                                          color: Colors.amber,
                                        ),
                                      ),
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(_fnPhoneNumber);
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Phone Number",
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                      focusNode: _fnPhoneNumber,
                                      controller: _txtPhoneNumber,
                                      maxLength: 16,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        counterText: "",
                                        fillColor: Colors.white,
                                        hintText: 'Phone Number',
                                        errorStyle: TextStyle(
                                          color: Colors.amber,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'You must fill this field';
                                        }

                                        if (value.length < 10 ||
                                            value.length > 16) {
                                          return 'Must more than 10 and less than 16';
                                        }

                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(_fnPhoneNumber);
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Gender",
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 0,
                                          groupValue: _radioValue,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.white),
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text(
                                          'Male',
                                        ),
                                        Radio(
                                          value: 1,
                                          groupValue: _radioValue,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.white),
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text(
                                          'Female',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Choose",
                                    ),
                                    const SizedBox(height: 4),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                              value: 0,
                                              groupValue: _radiovalue2,
                                              onChanged: showWidget,
                                              fillColor: MaterialStateColor.resolveWith(
                                                      (states) => Colors.white),
                                            ),
                                            Text(
                                              'Work from my location',
                                              style: TextStyle(
                                                  fontSize: 12, color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                              value: 1,
                                              groupValue: _radiovalue2,
                                              onChanged: hideWidget,
                                              fillColor: MaterialStateColor.resolveWith(
                                                      (states) => Colors.white),
                                            ),
                                            Text(
                                              'Work at your place',
                                              style: TextStyle(
                                                  fontSize: 12, color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                              value: 2,
                                              groupValue: _radiovalue2,
                                              onChanged: hideWidget,
                                              fillColor: MaterialStateColor.resolveWith(
                                                      (states) => Colors.white),
                                            ),
                                            Text(
                                              'Work online',
                                              style: TextStyle(
                                                  fontSize: 12, color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Visibility(
                                        visible: viewVisible,
                                        child: Row(
                                          children: [
                                            Text(
                                              "Address",
                                            ),
                                          ],
                                        )
                                    ),
                                    const SizedBox(height: 4),
                                    viewVisible? TextFormField(
                                      focusNode: _fnAddress,
                                      controller: _txtAddress,
                                      keyboardType: TextInputType.streetAddress,
                                      maxLength: 50,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        counterText: "",
                                        fillColor: Colors.white,
                                        hintText: 'Address',
                                        errorStyle: TextStyle(
                                          color: Colors.amber,
                                        ),
                                      ),
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context).unfocus();
                                      },
                                    ):Container(),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Profession",
                                    ),
                                    const SizedBox(height: 4),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                        child: DropdownButton(
                                          isExpanded: true,
                                          underline: SizedBox(),
                                          value: selectedSpecialist,
                                          items: generateItems(specialist),
                                          onChanged: (dynamic item) {
                                            setState(() {
                                              selectedSpecialist = item;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Bank Number",
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                      focusNode: _fnBankAccount,
                                      controller: _txtBankAccount,
                                      maxLength: 16,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        filled: true,
                                        counterText: "",
                                        fillColor: Colors.white,
                                        hintText: 'Bank Account',
                                        errorStyle: TextStyle(
                                          color: Colors.amber,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'You must fill this field';
                                        }

                                        if (value.length < 10 ||
                                            value.length > 16) {
                                          return 'Must more than 10 and less than 16';
                                        }

                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(_fnBankAccount);
                                      },
                                    ),
                                    const SizedBox(height: 22.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        _isLoading
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.white),
                                              )
                                            : MaterialButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    _isLoading = true;
                                                  });

                                                  await _editProfile();

                                                  setState(() {
                                                    _isLoading = false;
                                                  });

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          "Edit Profile Success"),
                                                    ),
                                                  );

                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("Edit Profile"),
                                                color: AppTheme.darkerPrimaryColor,
                                                textColor: Colors.white,
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                      ],
                                    ),
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
              ),
            );
          },
        ),
      ),
    );
  }

  _editProfile() async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    if (_genderValue == "") {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You must choose gender"),
        ),
      );
      return;
    }

    if (selectedSpecialist == "") {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You must choose Specialist"),
        ),
      );
      return;
    }

    if (_chooseValue == "") {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You must choose"),
        ),
      );
      return;
    }

    try {
      Map<String, dynamic> data = {
        'doc_id': doctor!.uid,
        'name': _txtName.text,
        'email': _txtEmail.text,
        'phone_number': _txtPhoneNumber.text,
        'gender': _genderValue,
        'choose': _chooseValue,
        'address': _txtAddress.text,
        'specialist': selectedSpecialist,
        'bank_account': _txtBankAccount.text,
        'is_busy': false,
        'profile_url': doctor!.profileUrl,
      };

      await FirebaseFirestore.instance
          .doc('doctor/${doctor!.uid}')
          .update(data);

      Doctor newData = Doctor.fromJson(data);
      Provider.of<DoctorProvider>(context, listen: false).setDoctor = newData;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Something went wrong"),
        ),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }
  }
}
