class UserResModel {
  Nandghar? nandghar;
  Ifmr? ifmr;

  UserResModel({this.nandghar, this.ifmr});

  UserResModel.fromJson(Map<String, dynamic> json) {
    nandghar = json['nandghar'] != null
        ? new Nandghar.fromJson(json['nandghar'])
        : null;
    ifmr = json['ifmr'] != null ? new Ifmr.fromJson(json['ifmr']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nandghar != null) {
      data['nandghar'] = this.nandghar!.toJson();
    }
    if (this.ifmr != null) {
      data['ifmr'] = this.ifmr!.toJson();
    }
    return data;
  }
}

class Nandghar {
  bool? success;
  int? status;
  String? message;
  String? tokenNandghar;
  int? loginId;
  int? lastLogin;
  int? timestamp;

  Nandghar(
      {this.success,
        this.status,
        this.message,
        this.tokenNandghar,
        this.loginId,
        this.lastLogin,
        this.timestamp});

  Nandghar.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    tokenNandghar = json['token_nandghar'];
    loginId = json['login_id'];
    lastLogin = json['last_login'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    data['token_nandghar'] = this.tokenNandghar;
    data['login_id'] = this.loginId;
    data['last_login'] = this.lastLogin;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Ifmr {
  bool? success;
  int? status;
  String? message;
  String? tokenIfmr;
  int? loginId;
  int? lastLogin;
  List<Locations>? locations;
  int? timestamp;

  Ifmr(
      {this.success,
        this.status,
        this.message,
        this.tokenIfmr,
        this.loginId,
        this.lastLogin,
        this.locations,
        this.timestamp});

  Ifmr.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    tokenIfmr = json['token_ifmr'];
    loginId = json['login_id'];
    lastLogin = json['last_login'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    data['token_ifmr'] = this.tokenIfmr;
    data['login_id'] = this.loginId;
    data['last_login'] = this.lastLogin;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Locations {
  String? id;
  String? name;

  Locations({this.id, this.name});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}