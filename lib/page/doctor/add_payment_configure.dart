part of '../pages.dart';

class AddPaymentConfigure extends StatefulWidget {
  @override
  _AddPaymentConfigureState createState() => _AddPaymentConfigureState();
}

class _AddPaymentConfigureState extends State<AddPaymentConfigure> {
  bool _isLoading = false;
  bool viewVisible = false;


  int? _radioValue = 0;

  int? _radiovalue2 = 3;
  String _genderValue = 'Male';
  String _chooseValue = 'Place';

  String? selectedSpecialist = "General practitioners";
  List<String> specialist = [
    "General practitioners",
    "Surgeon",
    "Dentist",
  ];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late var size;
  late var height;
  late var width;

  late DateTime _selectedDate;

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtNumber = TextEditingController();
  TextEditingController _txtDate = TextEditingController();
  TextEditingController _txtPhone = TextEditingController();
  TextEditingController _txtCvv = TextEditingController();

  FocusNode _fnName = FocusNode();
  FocusNode _fnNumber = FocusNode();
  FocusNode _fnDate = FocusNode();
  FocusNode _fnPhone = FocusNode();
  FocusNode _fnCvv = FocusNode();

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
    _txtNumber.dispose();
    _txtDate.dispose();
    _txtPhone.dispose();
    _txtCvv.dispose();

    _fnName.dispose();
    _fnNumber.dispose();
    _fnDate.dispose();
    _fnPhone.dispose();
    _fnCvv.dispose();
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
                          "Register Paypal Account",
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
                                        .requestFocus(_fnNumber);
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Account Number",
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _txtNumber,
                                  focusNode: _fnNumber,
                                  maxLength: 30,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'Account Number',
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
                                        .requestFocus(_fnDate);
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Expiry Date",
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  focusNode: _fnDate,
                                  controller: _txtDate,
                                  onTap: (){
                                    _selectDate(context);
                                  },
                                  maxLength: 16,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'Expiry Date',
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
                                        .requestFocus(_fnPhone);
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Phone Number",
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  focusNode: _fnPhone,
                                  controller: _txtPhone,
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
                                        .requestFocus(_fnCvv);
                                  },
                                ),
                                const SizedBox(height: 16),

                                        Text(
                                          "CVV",
                                        ),
                                const SizedBox(height: 4),
                               TextFormField(
                                  focusNode: _fnCvv,
                                  controller: _txtCvv,
                                  keyboardType: TextInputType.streetAddress,
                                  maxLength: 50,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'CVV',
                                    errorStyle: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).unfocus();
                                  },
                                )
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
                            child: Text("Submit"),
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

  _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019, 1),
      lastDate: DateTime(2031,12),
    )
        .then((selectedDate) {
      //TODO: handle selected date
      if(selectedDate!=null){
        int index = 0;
        List formatter = selectedDate.toString().split(' ');
        _txtDate.text = formatter[0].toString();
      }
    });
  }

  _register() async {
    // Checking if all form validator are valid
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    Map<String, dynamic> data = {
      'name': _txtName.text,
      'Account Number': _txtNumber.text,
      'Expiry Date': _txtDate.text,
      'Phone Number': _txtPhone.text,
      'CVV': _txtCvv.text,
      'is_busy': false,
      'profile_url': "",
    };
    try {
      // Creating new user
      // Doctor Data from Form Field


      // Set doctor data to Firestore, as you can see we using the uid created from FirebaseAuth
      // So the FirebaseAuth.instance.currentUser.uid are matching with this documentId
      // It'll be easier to grab the document, as the ID are matching
      await FirebaseFirestore.instance.doc('Paypal Account/${_txtName.text}').set(
        data,
        SetOptions(merge: true),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Register Account Success"),
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

class AddRazorPayConfigure extends StatefulWidget {
  @override
  _AddRazorPayConfigureState createState() => _AddRazorPayConfigureState();
}

class _AddRazorPayConfigureState extends State<AddRazorPayConfigure> {
  bool _isLoading = false;
  bool viewVisible = false;



  int? _radioValue = 0;

  int? _radiovalue2 = 3;
  String _genderValue = 'Male';
  String _chooseValue = 'Place';

  String? selectedSpecialist = "General practitioners";
  List<String> specialist = [
    "General practitioners",
    "Surgeon",
    "Dentist",
  ];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late var size;
  late var height;
  late var width;
  late DateTime _selectedDate;
  int date = 0;
  TextEditingController _txtNamee = TextEditingController();
  TextEditingController _txtNumberr = TextEditingController();
  TextEditingController _txtDatee = TextEditingController();
  TextEditingController _txtPhonee = TextEditingController();
  TextEditingController _txtCvvv = TextEditingController();

  FocusNode _fnNamee = FocusNode();
  FocusNode _fnNumberr = FocusNode();
  FocusNode _fnDatee = FocusNode();
  FocusNode _fnPhonee = FocusNode();
  FocusNode _fnCvvv = FocusNode();

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
    _txtNamee.dispose();
    _txtNumberr.dispose();
    _txtDatee.dispose();
    _txtPhonee.dispose();
    _txtCvvv.dispose();

    _fnNamee.dispose();
    _fnNumberr.dispose();
    _fnDatee.dispose();
    _fnPhonee.dispose();
    _fnCvvv.dispose();
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
                          "Register RazorPay Account",
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
                                  controller: _txtNamee,
                                  focusNode: _fnNamee,
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
                                        .requestFocus(_fnNumberr);
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Account Number",
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _txtNumberr,
                                  focusNode: _fnNumberr,
                                  maxLength: 30,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'Account Number',
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
                                        .requestFocus(_fnDatee);
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Expiry Date",
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  focusNode: _fnDatee,
                                  controller: _txtDatee,
                                  onTap: (){ _selectDate(context); },
                                  maxLength: 16,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'Expiry Date',
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
                                        .requestFocus(_fnPhonee);
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Phone Number",
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  focusNode: _fnPhonee,
                                  controller: _txtPhonee,
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
                                        .requestFocus(_fnCvvv);
                                  },
                                ),
                                const SizedBox(height: 16),

                                Text(
                                  "CVV",
                                ),
                                const SizedBox(height: 4),
                                TextFormField(
                                  focusNode: _fnCvvv,
                                  controller: _txtCvvv,
                                  keyboardType: TextInputType.streetAddress,
                                  maxLength: 50,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    counterText: "",
                                    fillColor: Colors.white,
                                    hintText: 'CVV',
                                    errorStyle: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).unfocus();
                                  },
                                )
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
                            child: Text("Submit"),
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

  _selectDate(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2031,12),
       )
        .then((selectedDate) {
      //TODO: handle selected date
      if(selectedDate!=null){
        int index = 0;
        List formatter = selectedDate.toString().split(' ');
        _txtDatee.text = formatter[0].toString();

      }
    });
  }

  _register() async {
    // Checking if all form validator are valid
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    Map<String, dynamic> data = {
      'name': _txtNamee.text,
      'Account Number': _txtNumberr.text,
      'Expiry Date': _txtDatee.text,
      'Phone Number': _txtPhonee.text,
      'CVV': _txtCvvv.text,
      'is_busy': false,
      'profile_url': "",
    };
    try {
      // Creating new user
      // Doctor Data from Form Field


      // Set doctor data to Firestore, as you can see we using the uid created from FirebaseAuth
      // So the FirebaseAuth.instance.currentUser.uid are matching with this documentId
      // It'll be easier to grab the document, as the ID are matching
      await FirebaseFirestore.instance.doc('RazorPay Account/${_txtNamee.text}').set(
        data,
        SetOptions(merge: true),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Register Account Success"),
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
