part of '../pages.dart';

class RegisterDoctorPage extends StatefulWidget {
  @override
  _RegisterDoctorPageState createState() => _RegisterDoctorPageState();
}

class _RegisterDoctorPageState extends State<RegisterDoctorPage> {
  bool _isLoading = false;
  bool viewVisible = false;

  int? _radioValue = 0;
  int? _radiovalue2 = 1;

  String _genderValue = 'Male';
  String _chooseValue = 'place';

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

  late var size;
  late var height;
  late var width;

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  TextEditingController _txtAddress = TextEditingController();
  TextEditingController _txtPhoneNumber = TextEditingController();
  TextEditingController _txtBankAccount = TextEditingController();

  FocusNode _fnName = FocusNode();
  FocusNode _fnEmail = FocusNode();
  FocusNode _fnPassword = FocusNode();
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
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _txtName.dispose();
    _txtEmail.dispose();
    _txtPassword.dispose();
    _txtAddress.dispose();
    _txtPhoneNumber.dispose();
    _txtBankAccount.dispose();

    _fnName.dispose();
    _fnEmail.dispose();
    _fnPassword.dispose();
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/register.png",
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35)),
                      color: AppTheme.dangerColor,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: DefaultTextStyle(
                            style: TextStyle(color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
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
                                  maxLength: 30,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'example@gmail.com',
                                    errorStyle: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'You must fill this field';
                                    }

                                    if (!EmailValidator.validate(value)) {
                                      return 'Email is invalid';
                                    }

                                    return null;
                                  },
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(_fnPassword);
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Password",
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  focusNode: _fnPassword,
                                  controller: _txtPassword,
                                  maxLength: 16,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'Password',
                                    errorStyle: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'You must fill this field';
                                    }

                                    if (value.length <= 6) {
                                      return 'Password must more than 6 char';
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
                                      borderRadius: BorderRadius.circular(20),
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
                                        .requestFocus(_fnAddress);
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
                                      onChanged: _handleRadioValueChange,
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => Colors.white),
                                    ),
                                    Text(
                                      'Male',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    Radio(
                                      value: 1,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                      fillColor: MaterialStateColor.resolveWith(
                                              (states) => Colors.white),
                                    ),
                                    Text(
                                      'Female',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
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
                                      borderRadius: BorderRadius.circular(20),
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
                                ): Container(),
                                const SizedBox(height: 16),
                                Text(
                                  "Profession",
                                ),
                                const SizedBox(height: 4),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
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
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        _isLoading
                            ? CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                            : Container(
                          height: height / 18,
                          width: width / 2.5,
                          child: MaterialButton(
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });

                              await _register();

                              if (this.mounted) {
                                setState(() {
                                  _isLoading = false;
                                });
                                return;
                              }
                            },
                            child: Text("Register"),
                            color: AppTheme.darkerPrimaryColor,
                            textColor: Colors.white,
                            disabledColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _register() async {
    // Checking if all form validator are valid
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

    if (selectedSpecialist == "") {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You must choose specialist"),
        ),
      );
      return;
    }

    try {
      // Creating new user
      final dataAuth =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _txtEmail.text,
        password: _txtPassword.text,
      );

      // Doctor Data from Form Field
      Map<String, dynamic> data = {
        'doc_id': dataAuth.user!.uid,
        'name': _txtName.text,
        'email': _txtEmail.text,
        'phone_number': _txtPhoneNumber.text,
        'address': _txtAddress.text,
        'gender': _genderValue,
        'choose': _chooseValue,
        'specialist': selectedSpecialist,
        'bank_account': _txtBankAccount.text,
        'is_busy': false,
        'profile_url': "",
      };

      // Set doctor data to Firestore, as you can see we using the uid created from FirebaseAuth
      // So the FirebaseAuth.instance.currentUser.uid are matching with this documentId
      // It'll be easier to grab the document, as the ID are matching
      await FirebaseFirestore.instance.doc('doctor/${dataAuth.user!.uid}').set(
        data,
        SetOptions(merge: true),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Register Success, redirecting..."),
        ),
      );
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
