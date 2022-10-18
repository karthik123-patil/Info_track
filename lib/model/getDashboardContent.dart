/// status : "200"
/// errorDetail : {"id":"","message":""}
/// statusMessage : ""
/// accidentsCount : 119
/// alertsCount : 0
/// tripsCount : 9
/// dayDriveCount : 9
/// nightDriveCount : 0
/// duration : "3:41"
/// distance : "56"
/// haCount : 0
/// hbCount : 0
/// htCount : 0
/// avgSafetyScore : 100
/// avgLastSafetyScore : 100
/// accidentFlag : 0
/// alertsFlag : 0
/// avgSafetyScoreFlag : 0
/// tripsFlag : 0
/// distanceFlag : 0
/// durationFlag : 0
/// haFlag : 0
/// hbFlag : 0
/// htFlag : 0
/// policyIssueDate : "12/07/2019"
/// policyDuration : "1193"
/// totalDistanceTravelled : "791.3829999999998"
/// remainingDistanceLeft : null
/// rectSnippetFlag : 0
/// circularSnippetFlag : 0
/// schemeName : "Ten Thousands"
/// allowedKM : "NA"
/// timeLeft : -827
/// topUpName : "0 KM"
/// overSpeedCount : 0
/// overSpeedFlag : 0
/// ecoscoreList : [{"tripDate":"10","score":100}]

class GetDashboardContent {
  GetDashboardContent({
      String? status, 
      ErrorDetail? errorDetail, 
      String? statusMessage, 
      int? accidentsCount, 
      int? alertsCount, 
      int? tripsCount, 
      int? dayDriveCount, 
      int? nightDriveCount, 
      String? duration, 
      String? distance, 
      int? haCount, 
      int? hbCount, 
      int? htCount, 
      int? avgSafetyScore, 
      int? avgLastSafetyScore, 
      int? accidentFlag, 
      int? alertsFlag, 
      int? avgSafetyScoreFlag, 
      int? tripsFlag, 
      int? distanceFlag, 
      int? durationFlag, 
      int? haFlag, 
      int? hbFlag, 
      int? htFlag, 
      String? policyIssueDate, 
      String? policyDuration, 
      String? totalDistanceTravelled, 
      dynamic remainingDistanceLeft, 
      int? rectSnippetFlag, 
      int? circularSnippetFlag, 
      String? schemeName, 
      String? allowedKM, 
      int? timeLeft, 
      String? topUpName, 
      int? overSpeedCount, 
      int? overSpeedFlag, 
      List<EcoscoreList>? ecoscoreList,}){
    _status = status;
    _errorDetail = errorDetail;
    _statusMessage = statusMessage;
    _accidentsCount = accidentsCount;
    _alertsCount = alertsCount;
    _tripsCount = tripsCount;
    _dayDriveCount = dayDriveCount;
    _nightDriveCount = nightDriveCount;
    _duration = duration;
    _distance = distance;
    _haCount = haCount;
    _hbCount = hbCount;
    _htCount = htCount;
    _avgSafetyScore = avgSafetyScore;
    _avgLastSafetyScore = avgLastSafetyScore;
    _accidentFlag = accidentFlag;
    _alertsFlag = alertsFlag;
    _avgSafetyScoreFlag = avgSafetyScoreFlag;
    _tripsFlag = tripsFlag;
    _distanceFlag = distanceFlag;
    _durationFlag = durationFlag;
    _haFlag = haFlag;
    _hbFlag = hbFlag;
    _htFlag = htFlag;
    _policyIssueDate = policyIssueDate;
    _policyDuration = policyDuration;
    _totalDistanceTravelled = totalDistanceTravelled;
    _remainingDistanceLeft = remainingDistanceLeft;
    _rectSnippetFlag = rectSnippetFlag;
    _circularSnippetFlag = circularSnippetFlag;
    _schemeName = schemeName;
    _allowedKM = allowedKM;
    _timeLeft = timeLeft;
    _topUpName = topUpName;
    _overSpeedCount = overSpeedCount;
    _overSpeedFlag = overSpeedFlag;
    _ecoscoreList = ecoscoreList;
}

  GetDashboardContent.fromJson(dynamic json) {
    _status = json['status'];
    _errorDetail = json['errorDetail'] != null ? ErrorDetail.fromJson(json['errorDetail']) : null;
    _statusMessage = json['statusMessage'];
    _accidentsCount = json['accidentsCount'];
    _alertsCount = json['alertsCount'];
    _tripsCount = json['tripsCount'];
    _dayDriveCount = json['dayDriveCount'];
    _nightDriveCount = json['nightDriveCount'];
    _duration = json['duration'];
    _distance = json['distance'];
    _haCount = json['haCount'];
    _hbCount = json['hbCount'];
    _htCount = json['htCount'];
    _avgSafetyScore = json['avgSafetyScore'];
    _avgLastSafetyScore = json['avgLastSafetyScore'];
    _accidentFlag = json['accidentFlag'];
    _alertsFlag = json['alertsFlag'];
    _avgSafetyScoreFlag = json['avgSafetyScoreFlag'];
    _tripsFlag = json['tripsFlag'];
    _distanceFlag = json['distanceFlag'];
    _durationFlag = json['durationFlag'];
    _haFlag = json['haFlag'];
    _hbFlag = json['hbFlag'];
    _htFlag = json['htFlag'];
    _policyIssueDate = json['policyIssueDate'];
    _policyDuration = json['policyDuration'];
    _totalDistanceTravelled = json['totalDistanceTravelled'];
    _remainingDistanceLeft = json['remainingDistanceLeft'];
    _rectSnippetFlag = json['rectSnippetFlag'];
    _circularSnippetFlag = json['circularSnippetFlag'];
    _schemeName = json['schemeName'];
    _allowedKM = json['allowedKM'];
    _timeLeft = json['timeLeft'];
    _topUpName = json['topUpName'];
    _overSpeedCount = json['overSpeedCount'];
    _overSpeedFlag = json['overSpeedFlag'];
    if (json['ecoscoreList'] != null) {
      _ecoscoreList = [];
      json['ecoscoreList'].forEach((v) {
        _ecoscoreList?.add(EcoscoreList.fromJson(v));
      });
    }
  }
  String? _status;
  ErrorDetail? _errorDetail;
  String? _statusMessage;
  int? _accidentsCount;
  int? _alertsCount;
  int? _tripsCount;
  int? _dayDriveCount;
  int? _nightDriveCount;
  String? _duration;
  String? _distance;
  int? _haCount;
  int? _hbCount;
  int? _htCount;
  int? _avgSafetyScore;
  int? _avgLastSafetyScore;
  int? _accidentFlag;
  int? _alertsFlag;
  int? _avgSafetyScoreFlag;
  int? _tripsFlag;
  int? _distanceFlag;
  int? _durationFlag;
  int? _haFlag;
  int? _hbFlag;
  int? _htFlag;
  String? _policyIssueDate;
  String? _policyDuration;
  String? _totalDistanceTravelled;
  dynamic _remainingDistanceLeft;
  int? _rectSnippetFlag;
  int? _circularSnippetFlag;
  String? _schemeName;
  String? _allowedKM;
  int? _timeLeft;
  String? _topUpName;
  int? _overSpeedCount;
  int? _overSpeedFlag;
  List<EcoscoreList>? _ecoscoreList;

  String? get status => _status;
  ErrorDetail? get errorDetail => _errorDetail;
  String? get statusMessage => _statusMessage;
  int? get accidentsCount => _accidentsCount;
  int? get alertsCount => _alertsCount;
  int? get tripsCount => _tripsCount;
  int? get dayDriveCount => _dayDriveCount;
  int? get nightDriveCount => _nightDriveCount;
  String? get duration => _duration;
  String? get distance => _distance;
  int? get haCount => _haCount;
  int? get hbCount => _hbCount;
  int? get htCount => _htCount;
  int? get avgSafetyScore => _avgSafetyScore;
  int? get avgLastSafetyScore => _avgLastSafetyScore;
  int? get accidentFlag => _accidentFlag;
  int? get alertsFlag => _alertsFlag;
  int? get avgSafetyScoreFlag => _avgSafetyScoreFlag;
  int? get tripsFlag => _tripsFlag;
  int? get distanceFlag => _distanceFlag;
  int? get durationFlag => _durationFlag;
  int? get haFlag => _haFlag;
  int? get hbFlag => _hbFlag;
  int? get htFlag => _htFlag;
  String? get policyIssueDate => _policyIssueDate;
  String? get policyDuration => _policyDuration;
  String? get totalDistanceTravelled => _totalDistanceTravelled;
  dynamic get remainingDistanceLeft => _remainingDistanceLeft;
  int? get rectSnippetFlag => _rectSnippetFlag;
  int? get circularSnippetFlag => _circularSnippetFlag;
  String? get schemeName => _schemeName;
  String? get allowedKM => _allowedKM;
  int? get timeLeft => _timeLeft;
  String? get topUpName => _topUpName;
  int? get overSpeedCount => _overSpeedCount;
  int? get overSpeedFlag => _overSpeedFlag;
  List<EcoscoreList>? get ecoscoreList => _ecoscoreList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_errorDetail != null) {
      map['errorDetail'] = _errorDetail?.toJson();
    }
    map['statusMessage'] = _statusMessage;
    map['accidentsCount'] = _accidentsCount;
    map['alertsCount'] = _alertsCount;
    map['tripsCount'] = _tripsCount;
    map['dayDriveCount'] = _dayDriveCount;
    map['nightDriveCount'] = _nightDriveCount;
    map['duration'] = _duration;
    map['distance'] = _distance;
    map['haCount'] = _haCount;
    map['hbCount'] = _hbCount;
    map['htCount'] = _htCount;
    map['avgSafetyScore'] = _avgSafetyScore;
    map['avgLastSafetyScore'] = _avgLastSafetyScore;
    map['accidentFlag'] = _accidentFlag;
    map['alertsFlag'] = _alertsFlag;
    map['avgSafetyScoreFlag'] = _avgSafetyScoreFlag;
    map['tripsFlag'] = _tripsFlag;
    map['distanceFlag'] = _distanceFlag;
    map['durationFlag'] = _durationFlag;
    map['haFlag'] = _haFlag;
    map['hbFlag'] = _hbFlag;
    map['htFlag'] = _htFlag;
    map['policyIssueDate'] = _policyIssueDate;
    map['policyDuration'] = _policyDuration;
    map['totalDistanceTravelled'] = _totalDistanceTravelled;
    map['remainingDistanceLeft'] = _remainingDistanceLeft;
    map['rectSnippetFlag'] = _rectSnippetFlag;
    map['circularSnippetFlag'] = _circularSnippetFlag;
    map['schemeName'] = _schemeName;
    map['allowedKM'] = _allowedKM;
    map['timeLeft'] = _timeLeft;
    map['topUpName'] = _topUpName;
    map['overSpeedCount'] = _overSpeedCount;
    map['overSpeedFlag'] = _overSpeedFlag;
    if (_ecoscoreList != null) {
      map['ecoscoreList'] = _ecoscoreList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// tripDate : "10"
/// score : 100

class EcoscoreList {
  EcoscoreList({
      String? tripDate, 
      int? score,}){
    _tripDate = tripDate;
    _score = score;
}

  EcoscoreList.fromJson(dynamic json) {
    _tripDate = json['tripDate'];
    _score = json['score'];
  }
  String? _tripDate;
  int? _score;

  String? get tripDate => _tripDate;
  int? get score => _score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tripDate'] = _tripDate;
    map['score'] = _score;
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