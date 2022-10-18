import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:info/utils/shared_preff.dart';
import 'package:info/utils/strings.dart';
class ApiService {

  Future<dynamic> login(String userName, String pwd) async {
    String deviceId = await StorageUtil.instance.getStringValue(AppStrings.strDeviceId);
    String deviceToken = AppStrings.strDeviceToken;
    dynamic responseJson;
    try {
      final body = {
        "userName": userName,
        "password": pwd,
        "deviceId": deviceId,
        "deviceToken": deviceToken
      };

      final response = await http.post(Uri.parse(AppStrings.BASE_URL + AppStrings.loginParam),
          headers: <String, String> {
            HttpHeaders.contentTypeHeader :  "application/json",
          },
          body: jsonEncode(body)
      );
      responseJson = _response(response);
      return responseJson;
    }on TimeoutException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }on SocketException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }on Exception catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  Future<dynamic> getDashboardContent() async {
    String token = await StorageUtil.instance.getStringValue(AppStrings.strPrefAuthToken);
    String vehicleNo = await StorageUtil.instance.getStringValue(AppStrings.strPrefVehicleNo);
    dynamic responseJson;
    try {
      final body = {
        "authToken":token,
        "vehicleNo": vehicleNo,
        "startDate":"2020-03-01",
        "endDate":"2020-03-03",
        "reportMode":"M"
      };

      final response = await http.post(Uri.parse(AppStrings.BASE_URL + AppStrings.getDashboardContent),
          headers: <String, String> {
            HttpHeaders.contentTypeHeader :  "application/json",
          },
          body: jsonEncode(body)
      );
      responseJson = _response(response);
      return responseJson;
    }on TimeoutException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }on SocketException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }on Exception catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<dynamic> getCurrentLocation() async {
    String token = await StorageUtil.instance.getStringValue(AppStrings.strPrefAuthToken);
    String vehicleId = await StorageUtil.instance.getStringValue(AppStrings.strPrefVehicleId);
    String vehicleNo = await StorageUtil.instance.getStringValue(AppStrings.strPrefVehicleNo);
    dynamic responseJson;
    try {
      final body = {
        "authToken": token,
        "vehicleNo":vehicleNo,
        "vehicleId": vehicleId,
        "unitNo":""
      } ;

      final response = await http.post(Uri.parse(AppStrings.BASE_URL + AppStrings.getCurrentLocation),
          headers: <String, String> {
            HttpHeaders.contentTypeHeader :  "application/json",
          },
          body: jsonEncode(body)
      );
      responseJson = _response(response);
      return responseJson;
    }on TimeoutException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }on SocketException catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }on Exception catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        }
      case 201:
        {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        }
      case 400:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 401:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 403:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 404:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 500:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
    }
  }
}