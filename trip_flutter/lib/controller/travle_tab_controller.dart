import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_flutter/dao/travel_dao.dart';
import 'package:trip_flutter/model/travel_tab_model.dart';

class TravelTabController extends GetxController {
  final String groupChannelCode;

  TravelTabController(this.groupChannelCode);

  final travelItems = <TravelItem>[].obs;
  final loading = true.obs;
  int pageIndex = 1;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadData(loadMore: true);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  Future<void> loadData({loadMore = false}) async {
    if (loadMore) {
      pageIndex++;
    } else {
      pageIndex = 1;
    }

    try {
      TravelTabModel? model =
          await TravelDao.getTravels(groupChannelCode, pageIndex, 10);
      List<TravelItem> items = filterItems(model?.list);
      if (loadMore && items.isEmpty) {
        pageIndex--;
      }
      loading.value = false;
      if (!loadMore) {
        travelItems.clear();
      } else {
        travelItems.value = items;
      }
      travelItems.addAll(items);
    } catch (e) {
      //当出现类型转换异常时可以取消catchError，然后通过debug模式定位类型转换异常的字段
      loading.value = false;
      if (loadMore) {
        pageIndex--;
      }
    }
  }

  ///移除article为空的模型
  List<TravelItem> filterItems(List<TravelItem>? list) {
    if (list == null) return [];
    List<TravelItem> filterItems = [];
    for (var item in list) {
      if (item.article != null) {
        filterItems.add(item);
      }
    }
    return filterItems;
  }
}
