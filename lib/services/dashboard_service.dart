import 'package:http/http.dart' as http;
import 'package:pms/Api/api_url.dart';
import 'package:pms/models/dashboard_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardService {
  static Future<DashBoardModel?> getDashboardData() async {
    print('object first time *********************');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString("accessToken");
    // print('$accessToken' 'accessToken');
    DashBoardModel? dashBoardModel;
    final response = await http.get(ApiUrl.prices, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $accessToken",
    });
    print('response.body ' '${response.body}');
    if (response.statusCode == 200) {
      print('${response.body}' ' response.body');
      dashBoardModel = dashBoardModelFromJson(response.body);
    }
    return dashBoardModel;
  }
}
