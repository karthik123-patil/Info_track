/// status : "200"
/// errorDetail : {"id":"","message":""}
/// statusMessage : ""
/// authToken : "0d7a875a-5a3f-44f1-b8fb-327ea076b0dd"
/// userName : "PARTHASARATHI B"
/// emailId : ""
/// mobileNumber : "9538080000"
/// profilePicUrl : "http://staging.infosmart.co.in/mapp/infoinsure/resources/images/profileimages/22_PARTHASARATHIB.png?37"
/// emergencyContactNo : "7847030899"
/// policyDetails : [{"policyId":1,"policyType":"Comprehensive","policyNumber":"VMPB091564000100","policyHolder":"PARTHASARATHI B","policyIssueDate":"12/07/2019","policyExpiryDate":"12/07/2020","totalpremium":"1028.0","policyDocImageUrl":"http://staging.infosmart.co.in/mapp/infoinsure/resourcesVMPB091564000100","vehicleNo":"CANiQ Test","make":"HONDA MOTORS LTD","model":"CB UNICORN DAZZLER-2","vehicleProfilePicUrl":"http://staging.infosmart.co.in/mapp/infoinsure/resources/images/profileimages/1023_CANiQTest.png?27","vehicleTypeId":1,"vehicleId":1023,"totalDistance":0.0,"totalDuration":"","policyDuration":"","tollFreeNumber":"18002667780","schemeName":"","allowedKM":"","clientId":357}]

class Login {
  Login({
      String? status, 
      ErrorDetail? errorDetail, 
      String? statusMessage, 
      String? authToken, 
      String? userName, 
      String? emailId, 
      String? mobileNumber, 
      String? profilePicUrl, 
      String? emergencyContactNo, 
      List<PolicyDetails>? policyDetails,}){
    _status = status;
    _errorDetail = errorDetail;
    _statusMessage = statusMessage;
    _authToken = authToken;
    _userName = userName;
    _emailId = emailId;
    _mobileNumber = mobileNumber;
    _profilePicUrl = profilePicUrl;
    _emergencyContactNo = emergencyContactNo;
    _policyDetails = policyDetails;
}

  Login.fromJson(dynamic json) {
    _status = json['status'];
    _errorDetail = json['errorDetail'] != null ? ErrorDetail.fromJson(json['errorDetail']) : null;
    _statusMessage = json['statusMessage'];
    _authToken = json['authToken'];
    _userName = json['userName'];
    _emailId = json['emailId'];
    _mobileNumber = json['mobileNumber'];
    _profilePicUrl = json['profilePicUrl'];
    _emergencyContactNo = json['emergencyContactNo'];
    if (json['policyDetails'] != null) {
      _policyDetails = [];
      json['policyDetails'].forEach((v) {
        _policyDetails?.add(PolicyDetails.fromJson(v));
      });
    }
  }
  String? _status;
  ErrorDetail? _errorDetail;
  String? _statusMessage;
  String? _authToken;
  String? _userName;
  String? _emailId;
  String? _mobileNumber;
  String? _profilePicUrl;
  String? _emergencyContactNo;
  List<PolicyDetails>? _policyDetails;

  String? get status => _status;
  ErrorDetail? get errorDetail => _errorDetail;
  String? get statusMessage => _statusMessage;
  String? get authToken => _authToken;
  String? get userName => _userName;
  String? get emailId => _emailId;
  String? get mobileNumber => _mobileNumber;
  String? get profilePicUrl => _profilePicUrl;
  String? get emergencyContactNo => _emergencyContactNo;
  List<PolicyDetails>? get policyDetails => _policyDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_errorDetail != null) {
      map['errorDetail'] = _errorDetail?.toJson();
    }
    map['statusMessage'] = _statusMessage;
    map['authToken'] = _authToken;
    map['userName'] = _userName;
    map['emailId'] = _emailId;
    map['mobileNumber'] = _mobileNumber;
    map['profilePicUrl'] = _profilePicUrl;
    map['emergencyContactNo'] = _emergencyContactNo;
    if (_policyDetails != null) {
      map['policyDetails'] = _policyDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// policyId : 1
/// policyType : "Comprehensive"
/// policyNumber : "VMPB091564000100"
/// policyHolder : "PARTHASARATHI B"
/// policyIssueDate : "12/07/2019"
/// policyExpiryDate : "12/07/2020"
/// totalpremium : "1028.0"
/// policyDocImageUrl : "http://staging.infosmart.co.in/mapp/infoinsure/resourcesVMPB091564000100"
/// vehicleNo : "CANiQ Test"
/// make : "HONDA MOTORS LTD"
/// model : "CB UNICORN DAZZLER-2"
/// vehicleProfilePicUrl : "http://staging.infosmart.co.in/mapp/infoinsure/resources/images/profileimages/1023_CANiQTest.png?27"
/// vehicleTypeId : 1
/// vehicleId : 1023
/// totalDistance : 0.0
/// totalDuration : ""
/// policyDuration : ""
/// tollFreeNumber : "18002667780"
/// schemeName : ""
/// allowedKM : ""
/// clientId : 357

class PolicyDetails {
  PolicyDetails({
      int? policyId, 
      String? policyType, 
      String? policyNumber, 
      String? policyHolder, 
      String? policyIssueDate, 
      String? policyExpiryDate, 
      String? totalpremium, 
      String? policyDocImageUrl, 
      String? vehicleNo, 
      String? make, 
      String? model, 
      String? vehicleProfilePicUrl, 
      int? vehicleTypeId, 
      int? vehicleId, 
      double? totalDistance, 
      String? totalDuration, 
      String? policyDuration, 
      String? tollFreeNumber, 
      String? schemeName, 
      String? allowedKM, 
      int? clientId,}){
    _policyId = policyId;
    _policyType = policyType;
    _policyNumber = policyNumber;
    _policyHolder = policyHolder;
    _policyIssueDate = policyIssueDate;
    _policyExpiryDate = policyExpiryDate;
    _totalpremium = totalpremium;
    _policyDocImageUrl = policyDocImageUrl;
    _vehicleNo = vehicleNo;
    _make = make;
    _model = model;
    _vehicleProfilePicUrl = vehicleProfilePicUrl;
    _vehicleTypeId = vehicleTypeId;
    _vehicleId = vehicleId;
    _totalDistance = totalDistance;
    _totalDuration = totalDuration;
    _policyDuration = policyDuration;
    _tollFreeNumber = tollFreeNumber;
    _schemeName = schemeName;
    _allowedKM = allowedKM;
    _clientId = clientId;
}

  PolicyDetails.fromJson(dynamic json) {
    _policyId = json['policyId'];
    _policyType = json['policyType'];
    _policyNumber = json['policyNumber'];
    _policyHolder = json['policyHolder'];
    _policyIssueDate = json['policyIssueDate'];
    _policyExpiryDate = json['policyExpiryDate'];
    _totalpremium = json['totalpremium'];
    _policyDocImageUrl = json['policyDocImageUrl'];
    _vehicleNo = json['vehicleNo'];
    _make = json['make'];
    _model = json['model'];
    _vehicleProfilePicUrl = json['vehicleProfilePicUrl'];
    _vehicleTypeId = json['vehicleTypeId'];
    _vehicleId = json['vehicleId'];
    _totalDistance = json['totalDistance'];
    _totalDuration = json['totalDuration'];
    _policyDuration = json['policyDuration'];
    _tollFreeNumber = json['tollFreeNumber'];
    _schemeName = json['schemeName'];
    _allowedKM = json['allowedKM'];
    _clientId = json['clientId'];
  }
  int? _policyId;
  String? _policyType;
  String? _policyNumber;
  String? _policyHolder;
  String? _policyIssueDate;
  String? _policyExpiryDate;
  String? _totalpremium;
  String? _policyDocImageUrl;
  String? _vehicleNo;
  String? _make;
  String? _model;
  String? _vehicleProfilePicUrl;
  int? _vehicleTypeId;
  int? _vehicleId;
  double? _totalDistance;
  String? _totalDuration;
  String? _policyDuration;
  String? _tollFreeNumber;
  String? _schemeName;
  String? _allowedKM;
  int? _clientId;

  int? get policyId => _policyId;
  String? get policyType => _policyType;
  String? get policyNumber => _policyNumber;
  String? get policyHolder => _policyHolder;
  String? get policyIssueDate => _policyIssueDate;
  String? get policyExpiryDate => _policyExpiryDate;
  String? get totalpremium => _totalpremium;
  String? get policyDocImageUrl => _policyDocImageUrl;
  String? get vehicleNo => _vehicleNo;
  String? get make => _make;
  String? get model => _model;
  String? get vehicleProfilePicUrl => _vehicleProfilePicUrl;
  int? get vehicleTypeId => _vehicleTypeId;
  int? get vehicleId => _vehicleId;
  double? get totalDistance => _totalDistance;
  String? get totalDuration => _totalDuration;
  String? get policyDuration => _policyDuration;
  String? get tollFreeNumber => _tollFreeNumber;
  String? get schemeName => _schemeName;
  String? get allowedKM => _allowedKM;
  int? get clientId => _clientId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['policyId'] = _policyId;
    map['policyType'] = _policyType;
    map['policyNumber'] = _policyNumber;
    map['policyHolder'] = _policyHolder;
    map['policyIssueDate'] = _policyIssueDate;
    map['policyExpiryDate'] = _policyExpiryDate;
    map['totalpremium'] = _totalpremium;
    map['policyDocImageUrl'] = _policyDocImageUrl;
    map['vehicleNo'] = _vehicleNo;
    map['make'] = _make;
    map['model'] = _model;
    map['vehicleProfilePicUrl'] = _vehicleProfilePicUrl;
    map['vehicleTypeId'] = _vehicleTypeId;
    map['vehicleId'] = _vehicleId;
    map['totalDistance'] = _totalDistance;
    map['totalDuration'] = _totalDuration;
    map['policyDuration'] = _policyDuration;
    map['tollFreeNumber'] = _tollFreeNumber;
    map['schemeName'] = _schemeName;
    map['allowedKM'] = _allowedKM;
    map['clientId'] = _clientId;
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