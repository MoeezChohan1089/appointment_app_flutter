import 'package:appointment_app/provider/patient_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/admin/admin.dart';
import '../models/doctor/doctor.dart';
import 'doctor_provider.dart';

class AdminProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AdminModel? _admin;
  AdminModel? get admin => _admin;

  List<AdminModel> _users = [];
  List<AdminModel> get users => _users;

  PatientProvider? _patientProvider;
  PatientProvider? get patientProvider => _patientProvider;

  DoctorProvider? _doctorProvider;
  DoctorProvider? get doctorProvider => _doctorProvider;

  // For updating the value of DoctorProvider, we use it on main.dart for ChangeNotifierProxyProvider
  set update(DoctorProvider value) {
    this._doctorProvider = value;
    this._patientProvider = value as PatientProvider?;
    notifyListeners();
  }

  // We put the getUser() method inside the constructor, so everytime the Provider get called
  // We'll know is the User already login or not, if not then we set the User and Doctor value as null
  // So, they will ge redirect to SplashPage()
  AdminProvider() {
    getUser(this.doctorProvider);
  }

  // We fetching the data based on FirebaseAuth userChanges(), here for further information about userChanges() : https://firebase.flutter.dev/docs/auth/usage
  // Then we fetch the data from firestore with the uid we get from listening userChanges
  // And then put it inside the Provider whether is Doctor or User based on what the user are login on
  // Same goes if the user just registered it will called this method and then the user will be logged in
  getUser(DoctorProvider? doctorProvider) async {
    _isLoading = true;
    _admin = null;
    if (this.doctorProvider != null) this.doctorProvider!.setDoctor = null;
    FirebaseAuth.instance.userChanges().listen((currentUser) async {
      if (currentUser == null) {
        _admin = null;
        if (this.doctorProvider != null) this.doctorProvider!.setDoctor = null;
        _isLoading = false;
        notifyListeners();
        return;
      }

      var dataUser = await FirebaseFirestore.instance
          .doc('users/${currentUser.uid}')
          .get();

      var dataDoctor = await FirebaseFirestore.instance
          .doc('doctor/${currentUser.uid}')
          .get();

      if (dataUser.exists) {
        _admin = AdminModel.fromJson(dataUser.data()!);
        _isLoading = false;
        notifyListeners();
        return;
      } else if (dataDoctor.exists) {
        if (this.doctorProvider != null)
          this.doctorProvider!.setDoctor = Doctor.fromJson(dataDoctor.data()!);

        _isLoading = false;
        notifyListeners();
        return;
      }
    });
  }

  // Take all the data inside users collection
  getAllUsers() async {
    _isLoading = true;
    _users.clear();
    FirebaseFirestore.instance.collection('admin').get().then((value) {
      if (value.docs.isEmpty) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      _users.addAll(value.docs.map((e) => AdminModel.fromJson(e.data())));
      _isLoading = false;
      notifyListeners();
      return;
    });
  }
}
