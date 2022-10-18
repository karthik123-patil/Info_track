/// status : "200"
/// errorDetail : {"id":"","message":""}
/// statusMessage : ""
/// tracktime : "22-04-2020 18:48:09"
/// lat : 12.97796
/// lon : 77.5318
/// location : "Sri Ganapathi Tours And Travels,Sri Shylangar,Bangalore,Karnataka"
/// speed : 0
/// direction : 266.0
/// odometer : 585.34

class GetCurrentLocation {
  GetCurrentLocation({
      String? status, 
      ErrorDetail? errorDetail, 
      String? statusMessage, 
      String? tracktime, 
      double? lat, 
      double? lon, 
      String? location, 
      int? speed, 
      double? direction, 
      double? odometer,}){
    _status = status;
    _errorDetail = errorDetail;
    _statusMessage = statusMessage;
    _tracktime = tracktime;
    _lat = lat;
    _lon = lon;
    _location = location;
    _speed = speed;
    _direction = direction;
    _odometer = odometer;
}

  GetCurrentLocation.fromJson(dynamic json) {
    _status = json['status'];
    _errorDetail = json['errorDetail'] != null ? ErrorDetail.fromJson(json['errorDetail']) : null;
    _statusMessage = json['statusMessage'];
    _tracktime = json['tracktime'];
    _lat = json['lat'];
    _lon = json['lon'];
    _location = json['location'];
    _speed = json['speed'];
    _direction = json['direction'];
    _odometer = json['odometer'];
  }
  String? _status;
  ErrorDetail? _errorDetail;
  String? _statusMessage;
  String? _tracktime;
  double? _lat;
  double? _lon;
  String? _location;
  int? _speed;
  double? _direction;
  double? _odometer;

  String? get status => _status;
  ErrorDetail? get errorDetail => _errorDetail;
  String? get statusMessage => _statusMessage;
  String? get tracktime => _tracktime;
  double? get lat => _lat;
  double? get lon => _lon;
  String? get location => _location;
  int? get speed => _speed;
  double? get direction => _direction;
  double? get odometer => _odometer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_errorDetail != null) {
      map['errorDetail'] = _errorDetail?.toJson();
    }
    map['statusMessage'] = _statusMessage;
    map['tracktime'] = _tracktime;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['location'] = _location;
    map['speed'] = _speed;
    map['direction'] = _direction;
    map['odometer'] = _odometer;
    return map;
  }

}

/// id : ""
/// message : ""

class ErrorDetail {
  ErrorDetail({
      String? id, 
      String? message,}){
    _id = id;
    _message = message;
}

  ErrorDetail.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
  }
  String? _id;
  String? _message;

  String? get id => _id;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    return map;
  }

}