import 'package:flutter/material.dart';
import 'package:trip_flutter/dao/search_dao.dart';
import 'package:trip_flutter/model/search_model.dart';
import 'package:trip_flutter/util/view_util.dart';
import 'package:trip_flutter/widget/search_bar_widget.dart';

import '../util/navigator_util.dart';
import '../widget/search_item_widget.dart';

class SearchPage extends StatefulWidget {
  ///是否隐藏左侧返回键
  final bool? hideLeft;
  final String? keyword;
  final String? hint;

  const SearchPage({super.key, this.hideLeft = false, this.keyword, this.hint});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel? searchModel;
  String? keyword;

  get _appBar {
    //获取刘海屏Top安全边距
    double top = MediaQuery.of(context).padding.top;

    return shadowWarp(
      child: Container(
        height: 55 + top,
        decoration: const BoxDecoration(color: Colors.white),
        padding: EdgeInsets.only(top: top),
        child: SearchBarWidget(
          hideLeft: widget.hideLeft,
          defaultText: widget.keyword,
          hint: widget.hint,
          leftButtonClick: () => NavigatorUtil.pop(context),
          rightButtonClick: () {
            //收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          onChanged: _onTextChange,
        ),
      ),
      padding: const EdgeInsets.only(bottom: 5),
    );
  }

  get _listView => MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Expanded(
          child: ListView.builder(
            itemCount: searchModel?.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return _item(index);
            },
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    if (widget.keyword != null) {
      _onTextChange(widget.keyword!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_appBar, _listView],
      ),
    );
  }

  void _onTextChange(String value) async {
    try {
      var result = await SearchDao.fetch(value);
      if (result == null) return;
      //只有当，当前输入的内容和服务端返回的内容一致的时候才渲染
      if (result.keyword == value) {
        setState(() {
          searchModel = result;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget _item(int index) {
    var item = searchModel?.data?[index];
    if (item == null || searchModel == null) return Container();
    return SearchItemWidget(searchItem: item, searchModel: searchModel!);
  }
}
