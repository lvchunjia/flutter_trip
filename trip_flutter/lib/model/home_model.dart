class HomeModel {
  Config? config;
  List<CommonModel>? bannerList;
  List<CommonModel>? localNavList;
  GridNav? gridNav;
  List<CommonModel>? subNavList;
  SalesBox? salesBox;

  HomeModel({config, bannerList, localNavList, gridNav, subNavList, salesBox});

  HomeModel.fromJson(Map<String, dynamic> json) {
    config = json['config'] != null ? Config.fromJson(json['config']) : null;
    if (json['bannerList'] != null) {
      bannerList = <CommonModel>[];
      json['bannerList'].forEach((v) {
        bannerList!.add(CommonModel.fromJson(v));
      });
    }
    if (json['localNavList'] != null) {
      localNavList = <CommonModel>[];
      json['localNavList'].forEach((v) {
        localNavList!.add(CommonModel.fromJson(v));
      });
    }
    gridNav =
        json['gridNav'] != null ? GridNav.fromJson(json['gridNav']) : null;
    if (json['subNavList'] != null) {
      subNavList = <CommonModel>[];
      json['subNavList'].forEach((v) {
        subNavList!.add(CommonModel.fromJson(v));
      });
    }
    salesBox =
        json['salesBox'] != null ? SalesBox.fromJson(json['salesBox']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (config != null) {
      data['config'] = config!.toJson();
    }
    if (bannerList != null) {
      data['bannerList'] = bannerList!.map((v) => v.toJson()).toList();
    }
    if (localNavList != null) {
      data['localNavList'] = localNavList!.map((v) => v.toJson()).toList();
    }
    if (gridNav != null) {
      data['gridNav'] = gridNav!.toJson();
    }
    if (subNavList != null) {
      data['subNavList'] = subNavList!.map((v) => v.toJson()).toList();
    }
    if (salesBox != null) {
      data['salesBox'] = salesBox!.toJson();
    }
    return data;
  }
}

class Config {
  String? searchUrl;

  Config({searchUrl});

  Config.fromJson(Map<String, dynamic> json) {
    searchUrl = json['searchUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['searchUrl'] = searchUrl;
    return data;
  }
}

class BannerList {
  String? icon;
  String? url;

  BannerList({icon, url});

  BannerList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['url'] = url;
    return data;
  }
}

class CommonModel {
  String? icon;
  String? title;
  String? url;
  String? statusBarColor;
  bool? hideAppBar;

  CommonModel({icon, title, url, statusBarColor, hideAppBar});

  CommonModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['title'] = title;
    data['url'] = url;
    data['statusBarColor'] = statusBarColor;
    data['hideAppBar'] = hideAppBar;
    return data;
  }
}

class GridNav {
  Hotel? hotel;
  Hotel? flight;
  Hotel? travel;

  GridNav({hotel, flight, travel});

  GridNav.fromJson(Map<String, dynamic> json) {
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
    flight = json['flight'] != null ? Hotel.fromJson(json['flight']) : null;
    travel = json['travel'] != null ? Hotel.fromJson(json['travel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hotel != null) {
      data['hotel'] = hotel!.toJson();
    }
    if (flight != null) {
      data['flight'] = flight!.toJson();
    }
    if (travel != null) {
      data['travel'] = travel!.toJson();
    }
    return data;
  }
}

class Hotel {
  String? startColor;
  String? endColor;
  CommonModel? mainItem;
  CommonModel? item1;
  CommonModel? item2;
  CommonModel? item3;
  CommonModel? item4;

  Hotel({startColor, endColor, mainItem, item1, item2, item3, item4});

  Hotel.fromJson(Map<String, dynamic> json) {
    startColor = json['startColor'];
    endColor = json['endColor'];
    mainItem = json['mainItem'] != null
        ? CommonModel.fromJson(json['mainItem'])
        : null;
    item1 = json['item1'] != null ? CommonModel.fromJson(json['item1']) : null;
    item2 = json['item2'] != null ? CommonModel.fromJson(json['item2']) : null;
    item3 = json['item3'] != null ? CommonModel.fromJson(json['item3']) : null;
    item4 = json['item4'] != null ? CommonModel.fromJson(json['item4']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startColor'] = startColor;
    data['endColor'] = endColor;
    if (mainItem != null) {
      data['mainItem'] = mainItem!.toJson();
    }
    if (item1 != null) {
      data['item1'] = item1!.toJson();
    }
    if (item2 != null) {
      data['item2'] = item2!.toJson();
    }
    if (item3 != null) {
      data['item3'] = item3!.toJson();
    }
    if (item4 != null) {
      data['item4'] = item4!.toJson();
    }
    return data;
  }
}

class SalesBox {
  String? icon;
  String? moreUrl;
  CommonModel? bigCard1;
  CommonModel? bigCard2;
  CommonModel? smallCard1;
  CommonModel? smallCard2;
  CommonModel? smallCard3;
  CommonModel? smallCard4;

  SalesBox(
      {icon,
      moreUrl,
      bigCard1,
      bigCard2,
      smallCard1,
      smallCard2,
      smallCard3,
      smallCard4});

  SalesBox.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    moreUrl = json['moreUrl'];
    bigCard1 = json['bigCard1'] != null
        ? CommonModel.fromJson(json['bigCard1'])
        : null;
    bigCard2 = json['bigCard2'] != null
        ? CommonModel.fromJson(json['bigCard2'])
        : null;
    smallCard1 = json['smallCard1'] != null
        ? CommonModel.fromJson(json['smallCard1'])
        : null;
    smallCard2 = json['smallCard2'] != null
        ? CommonModel.fromJson(json['smallCard2'])
        : null;
    smallCard3 = json['smallCard3'] != null
        ? CommonModel.fromJson(json['smallCard3'])
        : null;
    smallCard4 = json['smallCard4'] != null
        ? CommonModel.fromJson(json['smallCard4'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['moreUrl'] = moreUrl;
    if (bigCard1 != null) {
      data['bigCard1'] = bigCard1!.toJson();
    }
    if (bigCard2 != null) {
      data['bigCard2'] = bigCard2!.toJson();
    }
    if (smallCard1 != null) {
      data['smallCard1'] = smallCard1!.toJson();
    }
    if (smallCard2 != null) {
      data['smallCard2'] = smallCard2!.toJson();
    }
    if (smallCard3 != null) {
      data['smallCard3'] = smallCard3!.toJson();
    }
    if (smallCard4 != null) {
      data['smallCard4'] = smallCard4!.toJson();
    }
    return data;
  }
}
