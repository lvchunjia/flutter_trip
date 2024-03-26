class SearchModel {
  String? keyword;
  int? code;
  List<SearchItem>? data;
  String? msg;

  SearchModel({this.code, this.data, this.msg});

  SearchModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <SearchItem>[];
      json['data'].forEach((v) {
        data!.add(SearchItem.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    return data;
  }
}

class SearchItem {
  String? code;
  String? word;
  String? type;
  String? districtname;
  String? url;
  String? price;
  String? zonename;
  String? star;
  bool? isBigIcon;
  String? imageUrl;
  String? subImageUrl;
  String? sourceType;

  SearchItem(
      {this.code,
      this.word,
      this.type,
      this.districtname,
      this.url,
      this.price,
      this.zonename,
      this.star,
      this.isBigIcon,
      this.imageUrl,
      this.subImageUrl,
      this.sourceType});

  SearchItem.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    word = json['word'];
    type = json['type'];
    districtname = json['districtname'];
    url = json['url'];
    price = json['price'];
    zonename = json['zonename'];
    star = json['star'];
    isBigIcon = json['isBigIcon'];
    imageUrl = json['imageUrl'];
    subImageUrl = json['subImageUrl'];
    sourceType = json['sourceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['word'] = word;
    data['type'] = type;
    data['districtname'] = districtname;
    data['url'] = url;
    data['price'] = price;
    data['zonename'] = zonename;
    data['star'] = star;
    data['isBigIcon'] = isBigIcon;
    data['imageUrl'] = imageUrl;
    data['subImageUrl'] = subImageUrl;
    data['sourceType'] = sourceType;
    return data;
  }
}
