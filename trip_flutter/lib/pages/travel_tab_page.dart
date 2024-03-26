import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:trip_flutter/controller/travle_tab_controller.dart';

import '../widget/loading_container.dart';
import '../widget/travel_item_widget.dart';

///旅拍列表页
class TravelTabPage extends StatefulWidget {
  final String groupChannelCode;

  const TravelTabPage({super.key, required this.groupChannelCode});

  @override
  State<TravelTabPage> createState() => _TravelTabPageState();
}

class _TravelTabPageState extends State<TravelTabPage>
    with AutomaticKeepAliveClientMixin {
  late TravelTabController controller;

  get _gridView => MasonryGridView.count(
        controller: controller.scrollController,
        crossAxisCount: 2,
        itemCount: controller.travelItems.length,
        itemBuilder: ((BuildContext context, int index) => TravelItemWidget(
              index: index,
              item: controller.travelItems[index],
            )),
      );

  get _getX => GetX<TravelTabController>(
        builder: (controller) {
          return LoadingContainer(
            isLoading: controller.loading.value,
            child: RefreshIndicator(
              color: Colors.blue,
              onRefresh: _handleRefresh,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: _gridView,
              ),
            ),
          );
        },
        init: controller,
      );

  get _obx => Obx(
        () => LoadingContainer(
          isLoading: controller.loading.value,
          child: RefreshIndicator(
            color: Colors.blue,
            onRefresh: _handleRefresh,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: _gridView,
            ),
          ),
        ),
      );

  @override
  void initState() {
    controller = Get.put(
      TravelTabController(widget.groupChannelCode),
      tag: widget.groupChannelCode,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _obx,
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _handleRefresh() async {
    await controller.loadData();
    return;
  }
}
