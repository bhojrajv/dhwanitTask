class GetDistrict {
  bool? success;
  int? status;
  String? message;
  int? timestamp;
  int? limit;
  List<District>? district;

  GetDistrict(
      {this.success,
        this.status,
        this.message,
        this.timestamp,
        this.limit,
        this.district});

  GetDistrict.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    timestamp = json['timestamp'];
    limit = json['limit'];
    if (json['district'] != null) {
      district = <District>[];
      json['district'].forEach((v) {
        district!.add(new District.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    data['timestamp'] = this.timestamp;
    data['limit'] = this.limit;
    if (this.district != null) {
      data['district'] = this.district!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class District {
  String? stateId;
  String? id;
  String? districtName;

  District({this.stateId, this.id, this.districtName});

  District.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    id = json['id'];
    districtName = json['district_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_id'] = this.stateId;
    data['id'] = this.id;
    data['district_name'] = this.districtName;
    return data;
  }
}