class GetChildList {
  bool? success;
  int? status;
  String? message;
  int? timestamp;
  int? limit;
  List<ChildProfile>? childProfile;

  GetChildList(
      {this.success,
        this.status,
        this.message,
        this.timestamp,
        this.limit,
        this.childProfile});

  GetChildList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    timestamp = json['timestamp'];
    limit = json['limit'];
    if (json['child_profile'] != null) {
      childProfile = <ChildProfile>[];
      json['child_profile'].forEach((v) {
        childProfile!.add(new ChildProfile.fromJson(v));
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
    if (this.childProfile != null) {
      data['child_profile'] =
          this.childProfile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildProfile {
  String? id;
  String? uniqueId;
  String? phaseType;
  String? nandgharId;
  String? name;
  String? fatherName;
  String? age;
  String? childStatus;
  String? gender;
  String? motherName;
  String? height;
  String? weight;
  String? nutritionStatus;
  String? villageName;
  String? verificationStatus;
  String? muacReading;
  String? photo;
  String? latitude;
  String? longitude;
  String? distance;
  String? updatedAt;
  String? createdAt;
  String? dob;
  String? status;
  String? accuracyTimestamp;
  String? mobileCreatedAt;
  String? uniqueNandgharId;
  String? nutritionDayCount;
  String? txnId;
  String? birthCertificate;
  String? otherGrowthParameter;

  ChildProfile(
      {this.id,
        this.uniqueId,
        this.phaseType,
        this.nandgharId,
        this.name,
        this.fatherName,
        this.age,
        this.childStatus,
        this.gender,
        this.motherName,
        this.height,
        this.weight,
        this.nutritionStatus,
        this.villageName,
        this.verificationStatus,
        this.muacReading,
        this.photo,
        this.latitude,
        this.longitude,
        this.distance,
        this.updatedAt,
        this.createdAt,
        this.dob,
        this.status,
        this.accuracyTimestamp,
        this.mobileCreatedAt,
        this.uniqueNandgharId,
        this.nutritionDayCount,
        this.txnId,
        this.birthCertificate,
        this.otherGrowthParameter});

  ChildProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uniqueId = json['unique_id'];
    phaseType = json['phase_type'];
    nandgharId = json['nandghar_id'];
    name = json['name'];
    fatherName = json['father_name'];
    age = json['age'];
    childStatus = json['child_status'];
    gender = json['gender'];
    motherName = json['mother_name'];
    height = json['height'];
    weight = json['weight'];
    nutritionStatus = json['nutrition_status'];
    villageName = json['village_name'];
    verificationStatus = json['verification_status'];
    muacReading = json['muac_reading'];
    photo = json['photo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    dob = json['dob'];
    status = json['status'];
    accuracyTimestamp = json['accuracy_timestamp'];
    mobileCreatedAt = json['mobile_created_at'];
    uniqueNandgharId = json['unique_nandghar_id'];
    nutritionDayCount = json['nutrition_day_count'];
    txnId = json['txn_id'];
    birthCertificate = json['birth_certificate'];
    otherGrowthParameter = json['other_growth_parameter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unique_id'] = this.uniqueId;
    data['phase_type'] = this.phaseType;
    data['nandghar_id'] = this.nandgharId;
    data['name'] = this.name;
    data['father_name'] = this.fatherName;
    data['age'] = this.age;
    data['child_status'] = this.childStatus;
    data['gender'] = this.gender;
    data['mother_name'] = this.motherName;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['nutrition_status'] = this.nutritionStatus;
    data['village_name'] = this.villageName;
    data['verification_status'] = this.verificationStatus;
    data['muac_reading'] = this.muacReading;
    data['photo'] = this.photo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['distance'] = this.distance;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['dob'] = this.dob;
    data['status'] = this.status;
    data['accuracy_timestamp'] = this.accuracyTimestamp;
    data['mobile_created_at'] = this.mobileCreatedAt;
    data['unique_nandghar_id'] = this.uniqueNandgharId;
    data['nutrition_day_count'] = this.nutritionDayCount;
    data['txn_id'] = this.txnId;
    data['birth_certificate'] = this.birthCertificate;
    data['other_growth_parameter'] = this.otherGrowthParameter;
    return data;
  }
}