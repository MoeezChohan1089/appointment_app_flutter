class ApiUrl{
  static const String BaseUrl = "http://176.57.189.188:8080/Hotels/api/";
  static var login = Uri.parse(BaseUrl+"auth/login");
  static var logout = Uri.parse(BaseUrl+"auth/logout");
  static var dashboard = Uri.parse(BaseUrl+"dashBoard");
  static var reservation = Uri.parse(BaseUrl+"reservation");
  static var prices = Uri.parse(BaseUrl+"reservation/calendar/month/01/year/2022");
}
