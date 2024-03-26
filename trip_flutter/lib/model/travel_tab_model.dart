//model/travel_tab_model.dart
///旅拍列表页模型
class TravelTabModel {
  int? total;
  List<TravelItem>? list;

  //命名构造方法
  TravelTabModel({total, list});

  TravelTabModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['list'] != null) {
      list = <TravelItem>[];
      json['list'].forEach((v) {
        list!.add(TravelItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TravelItem {
  int? type;
  Article? article;

  TravelItem({type, article});

  TravelItem.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    article =
        json['article'] != null ? Article.fromJson(json['article']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (article != null) {
      data['article'] = article!.toJson();
    }
    return data;
  }
}

class Article {
  int? articleId;
  int? productType;
  int? sourceType;
  String? articleTitle;
  String? content;
  String? contentWithoutCtag;
  Author? author;
  List<Images>? images;
  CoverGIF? coverGIF;
  bool? hasVideo;
  Video? video;
  int? readCount;
  int? likeCount;
  int? commentCount;
  int? shareCount;
  List<Urls>? urls;
  List<Tags>? tags;
  List<RelatedTopics>? relatedTopics;
  List<Pois>? pois;
  String? publishTime;
  String? publishTimeDisplay;
  String? shootTime;
  String? shootTimeDisplay;
  String? sourceInfo;
  int? level;
  String? distanceText;
  bool? isLike;
  int? imageCounts;
  bool? isCollected;
  int? collectCount;
  int? articleStatus;
  String? poiName;
  ShareInfo? shareInfo;
  String? currentDate;
  int? sourceId;
  String? videoAutoplayNet;
  String? combinateContent;

  Article(
      {articleId,
      productType,
      sourceType,
      articleTitle,
      content,
      contentWithoutCtag,
      author,
      images,
      coverGIF,
      hasVideo,
      video,
      readCount,
      likeCount,
      commentCount,
      shareCount,
      urls,
      tags,
      relatedTopics,
      pois,
      publishTime,
      publishTimeDisplay,
      shootTime,
      shootTimeDisplay,
      sourceInfo,
      level,
      distanceText,
      isLike,
      imageCounts,
      isCollected,
      collectCount,
      articleStatus,
      poiName,
      shareInfo,
      currentDate,
      sourceId,
      videoAutoplayNet,
      combinateContent});

  Article.fromJson(Map<String, dynamic> json) {
    articleId = json['articleId'];
    productType = json['productType'];
    sourceType = json['sourceType'];
    articleTitle = json['articleTitle'];
    content = json['content'];
    contentWithoutCtag = json['contentWithoutCtag'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    coverGIF =
        json['coverGIF'] != null ? CoverGIF.fromJson(json['coverGIF']) : null;
    hasVideo = json['hasVideo'];
    video = json['video'] != null ? Video.fromJson(json['video']) : null;
    readCount = json['readCount'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    shareCount = json['shareCount'];
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(Urls.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    if (json['relatedTopics'] != null) {
      relatedTopics = <RelatedTopics>[];
      json['relatedTopics'].forEach((v) {
        relatedTopics!.add(RelatedTopics.fromJson(v));
      });
    }
    if (json['pois'] != null) {
      pois = <Pois>[];
      json['pois'].forEach((v) {
        pois!.add(Pois.fromJson(v));
      });
    }
    publishTime = json['publishTime'];
    publishTimeDisplay = json['publishTimeDisplay'];
    shootTime = json['shootTime'];
    shootTimeDisplay = json['shootTimeDisplay'];
    sourceInfo = json['sourceInfo'];
    level = json['level'];
    distanceText = json['distanceText'];
    isLike = json['isLike'];
    imageCounts = json['imageCounts'];
    isCollected = json['isCollected'];
    collectCount = json['collectCount'];
    articleStatus = json['articleStatus'];
    poiName = json['poiName'];
    shareInfo = json['shareInfo'] != null
        ? ShareInfo.fromJson(json['shareInfo'])
        : null;
    currentDate = json['currentDate'];
    sourceId = json['sourceId'];
    videoAutoplayNet = json['videoAutoplayNet'];
    combinateContent = json['combinateContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['articleId'] = articleId;
    data['productType'] = productType;
    data['sourceType'] = sourceType;
    data['articleTitle'] = articleTitle;
    data['content'] = content;
    data['contentWithoutCtag'] = contentWithoutCtag;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (coverGIF != null) {
      data['coverGIF'] = coverGIF!.toJson();
    }
    data['hasVideo'] = hasVideo;
    if (video != null) {
      data['video'] = video!.toJson();
    }
    data['readCount'] = readCount;
    data['likeCount'] = likeCount;
    data['commentCount'] = commentCount;
    data['shareCount'] = shareCount;
    if (urls != null) {
      data['urls'] = urls!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (relatedTopics != null) {
      data['relatedTopics'] = relatedTopics!.map((v) => v.toJson()).toList();
    }
    if (pois != null) {
      data['pois'] = pois!.map((v) => v.toJson()).toList();
    }
    data['publishTime'] = publishTime;
    data['publishTimeDisplay'] = publishTimeDisplay;
    data['shootTime'] = shootTime;
    data['shootTimeDisplay'] = shootTimeDisplay;
    data['sourceInfo'] = sourceInfo;
    data['level'] = level;
    data['distanceText'] = distanceText;
    data['isLike'] = isLike;
    data['imageCounts'] = imageCounts;
    data['isCollected'] = isCollected;
    data['collectCount'] = collectCount;
    data['articleStatus'] = articleStatus;
    data['poiName'] = poiName;
    if (shareInfo != null) {
      data['shareInfo'] = shareInfo!.toJson();
    }
    data['currentDate'] = currentDate;
    data['sourceId'] = sourceId;
    data['videoAutoplayNet'] = videoAutoplayNet;
    data['combinateContent'] = combinateContent;
    return data;
  }
}

class Author {
  int? authorId;
  String? nickName;
  String? clientAuth;
  String? userUrl;
  String? jumpUrl;
  CoverImage? coverImage;
  String? qualification;
  String? tag;
  int? followCount;
  String? vIcon;
  int? levelValue;
  String? levelValueText;
  String? identityDesc;
  bool? isStarAccount;

  Author(
      {authorId,
      nickName,
      clientAuth,
      userUrl,
      jumpUrl,
      coverImage,
      qualification,
      tag,
      followCount,
      vIcon,
      levelValue,
      levelValueText,
      identityDesc,
      isStarAccount});

  Author.fromJson(Map<String, dynamic> json) {
    authorId = json['authorId'];
    nickName = json['nickName'];
    clientAuth = json['clientAuth'];
    userUrl = json['userUrl'];
    jumpUrl = json['jumpUrl'];
    coverImage = json['coverImage'] != null
        ? CoverImage.fromJson(json['coverImage'])
        : null;
    qualification = json['qualification'];
    tag = json['tag'];
    followCount = json['followCount'];
    vIcon = json['vIcon'];
    levelValue = json['levelValue'];
    levelValueText = json['levelValueText'];
    identityDesc = json['identityDesc'];
    isStarAccount = json['isStarAccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorId'] = authorId;
    data['nickName'] = nickName;
    data['clientAuth'] = clientAuth;
    data['userUrl'] = userUrl;
    data['jumpUrl'] = jumpUrl;
    if (coverImage != null) {
      data['coverImage'] = coverImage!.toJson();
    }
    data['qualification'] = qualification;
    data['tag'] = tag;
    data['followCount'] = followCount;
    data['vIcon'] = vIcon;
    data['levelValue'] = levelValue;
    data['levelValueText'] = levelValueText;
    data['identityDesc'] = identityDesc;
    data['isStarAccount'] = isStarAccount;
    return data;
  }
}

class CoverImage {
  String? dynamicUrl;
  String? originalUrl;

  CoverImage({dynamicUrl, originalUrl});

  CoverImage.fromJson(Map<String, dynamic> json) {
    dynamicUrl = json['dynamicUrl'];
    originalUrl = json['originalUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dynamicUrl'] = dynamicUrl;
    data['originalUrl'] = originalUrl;
    return data;
  }
}

class Images {
  int? imageId;
  String? dynamicUrl;
  String? originalUrl;
  double? width; //fix 有时会返回double数据，需要为double类型
  double? height; //fix 有时会返回double数据，需要为double类型
  int? mediaType;
  double? lat;
  double? lon;
  bool? isWaterMarked;

  Images(
      {imageId,
      dynamicUrl,
      originalUrl,
      width,
      height,
      mediaType,
      lat,
      lon,
      isWaterMarked});

  Images.fromJson(Map<String, dynamic> json) {
    imageId = json['imageId'];
    dynamicUrl = json['dynamicUrl'];
    originalUrl = json['originalUrl'];
    width = json['width'];
    height = json['height'];
    mediaType = json['mediaType'];
    lat = json['lat'];
    lon = json['lon'];
    isWaterMarked = json['isWaterMarked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageId'] = imageId;
    data['dynamicUrl'] = dynamicUrl;
    data['originalUrl'] = originalUrl;
    data['width'] = width;
    data['height'] = height;
    data['mediaType'] = mediaType;
    data['lat'] = lat;
    data['lon'] = lon;
    data['isWaterMarked'] = isWaterMarked;
    return data;
  }
}

class CoverGIF {
  String? originalUrl;

  CoverGIF({originalUrl});

  CoverGIF.fromJson(Map<String, dynamic> json) {
    originalUrl = json['originalUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['originalUrl'] = originalUrl;
    return data;
  }
}

class Video {
  int? videoId;
  String? coverImageUrl;
  String? videoUrl;
  int? mediaType;
  double? width; //fix 有时会返回double数据，需要为double类型
  double? height; //fix 有时会返回double数据，需要为double类型
  int? durationSeconds;

  Video(
      {videoId,
      coverImageUrl,
      videoUrl,
      mediaType,
      width,
      height,
      durationSeconds});

  Video.fromJson(Map<String, dynamic> json) {
    videoId = json['videoId'];
    coverImageUrl = json['coverImageUrl'];
    videoUrl = json['videoUrl'];
    mediaType = json['mediaType'];
    width = json['width'];
    height = json['height'];
    durationSeconds = json['durationSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videoId'] = videoId;
    data['coverImageUrl'] = coverImageUrl;
    data['videoUrl'] = videoUrl;
    data['mediaType'] = mediaType;
    data['width'] = width;
    data['height'] = height;
    data['durationSeconds'] = durationSeconds;
    return data;
  }
}

class Urls {
  String? version;
  String? appUrl;
  String? h5Url;
  String? wxUrl;

  Urls({version, appUrl, h5Url, wxUrl});

  Urls.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    appUrl = json['appUrl'];
    h5Url = json['h5Url'];
    wxUrl = json['wxUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['appUrl'] = appUrl;
    data['h5Url'] = h5Url;
    data['wxUrl'] = wxUrl;
    return data;
  }
}

class Tags {
  int? tagId;
  String? tagName;
  int? tagLevel;
  int? parentTagId;
  int? source;
  int? sortIndex;

  Tags({tagId, tagName, tagLevel, parentTagId, source, sortIndex});

  Tags.fromJson(Map<String, dynamic> json) {
    tagId = json['tagId'];
    tagName = json['tagName'];
    tagLevel = json['tagLevel'];
    parentTagId = json['parentTagId'];
    source = json['source'];
    sortIndex = json['sortIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tagId'] = tagId;
    data['tagName'] = tagName;
    data['tagLevel'] = tagLevel;
    data['parentTagId'] = parentTagId;
    data['source'] = source;
    data['sortIndex'] = sortIndex;
    return data;
  }
}

class RelatedTopics {
  int? topicId;
  String? topicName;
  int? type;

  RelatedTopics({topicId, topicName, type});

  RelatedTopics.fromJson(Map<String, dynamic> json) {
    topicId = json['topicId'];
    topicName = json['topicName'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topicId'] = topicId;
    data['topicName'] = topicName;
    data['type'] = type;
    return data;
  }
}

class Pois {
  int? poiType;
  int? poiId;
  String? poiName;
  int? businessId;
  int? districtId;
  String? districtName;
  PoiExt? poiExt;
  int? source;
  int? isMain;
  bool? isInChina;
  String? countryName;
  String? districtENName;

  Pois(
      {poiType,
      poiId,
      poiName,
      businessId,
      districtId,
      districtName,
      poiExt,
      source,
      isMain,
      isInChina,
      countryName,
      districtENName});

  Pois.fromJson(Map<String, dynamic> json) {
    poiType = json['poiType'];
    poiId = json['poiId'];
    poiName = json['poiName'];
    businessId = json['businessId'];
    districtId = json['districtId'];
    districtName = json['districtName'];
    poiExt = json['poiExt'] != null ? PoiExt.fromJson(json['poiExt']) : null;
    source = json['source'];
    isMain = json['isMain'];
    isInChina = json['isInChina'];
    countryName = json['countryName'];
    districtENName = json['districtENName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['poiType'] = poiType;
    data['poiId'] = poiId;
    data['poiName'] = poiName;
    data['businessId'] = businessId;
    data['districtId'] = districtId;
    data['districtName'] = districtName;
    if (poiExt != null) {
      data['poiExt'] = poiExt!.toJson();
    }
    data['source'] = source;
    data['isMain'] = isMain;
    data['isInChina'] = isInChina;
    data['countryName'] = countryName;
    data['districtENName'] = districtENName;
    return data;
  }
}

class PoiExt {
  String? h5Url;
  String? appUrl;

  PoiExt({h5Url, appUrl});

  PoiExt.fromJson(Map<String, dynamic> json) {
    h5Url = json['h5Url'];
    appUrl = json['appUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['h5Url'] = h5Url;
    data['appUrl'] = appUrl;
    return data;
  }
}

class ShareInfo {
  String? imageUrl;
  String? shareTitle;
  String? shareContent;
  String? platForm;
  String? token;

  ShareInfo({imageUrl, shareTitle, shareContent, platForm, token});

  ShareInfo.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    shareTitle = json['shareTitle'];
    shareContent = json['shareContent'];
    platForm = json['platForm'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['shareTitle'] = shareTitle;
    data['shareContent'] = shareContent;
    data['platForm'] = platForm;
    data['token'] = token;
    return data;
  }
}
