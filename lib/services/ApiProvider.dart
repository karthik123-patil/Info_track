import 'package:info/model/getCurrentLocation.dart';
import 'package:info/model/getDashboardContent.dart';
import 'package:info/model/login.dart';
import 'package:info/services/ApiService.dart';

class ApiProvider {
  ApiService apiService = ApiService();

  Future<Login> login(String userName, String pwd) async {
    final response = await apiService.login(userName, pwd);
    return Login.fromJson(response);
  }

  Future<GetDashboardContent> getDashboardContent() async {
    final response = await apiService.getDashboardContent();
    return GetDashboardContent.fromJson(response);
  }

  Future<GetCurrentLocation> getCurrentLocation() async {
    final response = await apiService.getCurrentLocation();
    return GetCurrentLocation.fromJson(response);
  }

}