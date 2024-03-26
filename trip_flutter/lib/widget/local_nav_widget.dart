import 'package:flutter/material.dart';

import '../model/home_model.dart';
import '../util/navigator_util.dart';

/// 球区入口
class LocalNavWidget extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNavWidget({super.key, required this.localNavList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(7, 4, 7, 4),
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    List<Widget> items = [];
    for (var model in localNavList) {
      items.add(_item(context, model));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: items);
  }

  Widget _item(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.jumpH5(
          url: model.url,
          statusBarColor: model.statusBarColor,
          title: model.title,
          hideAppBar: model.hideAppBar,
        );
      },
      child: Column(
        children: [
          Image.network(
            model.icon!,
            width: 32,
            height: 32,
          ),
          Text(
            model.title!,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
