import 'package:flutter/material.dart';
import 'package:trip_flutter/dao/home_dao.dart';
import 'package:trip_flutter/dao/login_dao.dart';
import 'package:trip_flutter/model/home_model.dart';
import 'package:trip_flutter/pages/search_page.dart';
import 'package:trip_flutter/widget/CustomGridView.dart';
import 'package:trip_flutter/widget/grid_nav_widget.dart';
import 'package:trip_flutter/widget/loading_container.dart';
import 'package:trip_flutter/widget/local_nav_widget.dart';
import 'package:trip_flutter/widget/sales_box_widget.dart';
import 'package:trip_flutter/widget/sub_nav_widget.dart';

import '../util/navigator_util.dart';
import '../util/view_util.dart';
import '../widget/banner_widget.dart';
import '../widget/search_bar_widget.dart';

const searchBarDefaultText = '网红打开地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  static Config? configModel;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  static const appBarScrollOffset = 100;
  double appBarOpacity = 0;
  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  List<CommonModel> subNavList = [];
  GridNav? gridNavModel;
  SalesBox? salesBoxModel;
  bool _loading = true;

  get _appBar {
    //获取刘海屏实际的Top 安全边距
    double top = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        shadowWarp(
          child: Container(
            padding: EdgeInsets.only(top: top),
            height: 60 + top,
            decoration: BoxDecoration(
              color:
                  Color.fromARGB((appBarOpacity * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBarWidget(
              searchBarType: appBarOpacity > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              defaultText: searchBarDefaultText,
              rightButtonClick: () {
                LoginDao.logOut();
              },
            ),
          ),
        ),
        // bottom line
        Container(
          height: appBarOpacity > 0.2 ? 0.5 : 0,
          decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)],
          ),
        ),
      ],
    );
  }

  get _listView => ListView(
        children: [
          BannerWidget(bannerList: bannerList),
          LocalNavWidget(localNavList: localNavList),
          if (gridNavModel != null) GridNavWidget(gridNavModel: gridNavModel!),
          SubNavWidget(subNavList: subNavList),
          if (salesBoxModel != null) SalesBoxWidget(salesBox: salesBoxModel!),
          CostomGridView(),
        ],
      );

  get _contentView => MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: RefreshIndicator(
          color: Colors.blue,
          onRefresh: _handleRefresh,
          child: NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.depth == 0) {
                // 判断是列表滚动还是AppBar滚动
                _onScroll(scrollNotification.metrics.pixels);
              }
              return false;
            },
            child: _listView,
          ),
        ),
      );

  @override
  void initState() {
    super.initState();

    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: _loading,
        child: Stack(
          children: [
            _contentView,
            _appBar,
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _onScroll(double pixels) {
    double alpha = pixels / appBarScrollOffset;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      appBarOpacity = alpha;
    });
  }

  Future<void> _handleRefresh() async {
    try {
      HomeModel? model = await HomeDao.fetch();
      if (model == null) {
        setState(() {
          _loading = false;
        });
        return;
      }

      setState(() {
        HomePage.configModel = model.config;
        localNavList = model.localNavList ?? [];
        subNavList = model.subNavList ?? [];
        gridNavModel = model.gridNav;
        salesBoxModel = model.salesBox;
        bannerList = model.bannerList ?? [];
        _loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _jumpToSearch() {
    NavigatorUtil.push(context, const SearchPage());
  }
}
