class DataModel {
  int? code;
  Data? data;
  String? msg;

  DataModel({this.code, this.data, this.msg});

  DataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = msg;
    return data;
  }
}

class Data {
  int? code;
  String? method;
  String? requestPrams;

  Data({this.code, this.method, this.requestPrams});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    method = json['method'];
    requestPrams = json['requestPrams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['method'] = method;
    data['requestPrams'] = requestPrams;
    return data;
  }
}
