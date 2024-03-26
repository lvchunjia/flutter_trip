///旅拍类别模型
class TravelCategoryModel {
  ///旅拍类别列表
  late List<TravelTab> tabs; //因为是不可空，所以这里用late修饰

  TravelCategoryModel({required tabs});

  TravelCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['tabs'] != null) {
      tabs = List<TravelTab>.empty(growable: true);
      json['tabs'].forEach((v) {
        tabs.add(TravelTab.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tabs'] = tabs.map((v) => v.toJson()).toList();
    return data;
  }
}

class TravelTab {
  ///旅拍类别显示名称
  late String labelName;

  ///旅拍类别显搜索名字
  late String groupChannelCode;

  TravelTab({required labelName, required groupChannelCode});

  TravelTab.fromJson(Map<String, dynamic> json) {
    labelName = json['labelName'];
    groupChannelCode = json['groupChannelCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labelName'] = labelName;
    data['groupChannelCode'] = groupChannelCode;
    return data;
  }
}
