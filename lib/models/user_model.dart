class UserModel {
  static final UserModel _userModel = UserModel._internal();
  factory UserModel() {
    return _userModel;
  }

  UserModel._internal();


  String? id;
  String? accessToken;
  String? tokenType;
  String? email;
  String? phoneNo;
  String? pass;
  String? name;
  String? errorMessage;
}
