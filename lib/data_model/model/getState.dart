class Getstate {
  bool? success;
  int? status;
  String? message;
  int? timestamp;
  int? limit;
  List<State>? state;

  Getstate(
      {this.success,
        this.status,
        this.message,
        this.timestamp,
        this.limit,
        this.state});

  Getstate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    timestamp = json['timestamp'];
    limit = json['limit'];
    if (json['state'] != null) {
      state = <State>[];
      json['state'].forEach((v) {
        state!.add(new State.fromJson(v));
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
    if (this.state != null) {
      data['state'] = this.state!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class State {
  String? id;
  String? stateName;

  State({this.id, this.stateName});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state_name'] = this.stateName;
    return data;
  }
}