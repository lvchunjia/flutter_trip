import 'package:flutter/material.dart';

import '../model/search_model.dart';
import '../util/navigator_util.dart';

const types = [
  'channelgroup',
  'channelgs',
  'channelplane',
  'channeltrain',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];

class SearchItemWidget extends StatelessWidget {
  final SearchModel searchModel;
  final SearchItem searchItem;

  const SearchItemWidget(
      {super.key, required this.searchModel, required this.searchItem});

  get _item => Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.3, color: Colors.grey),
          ),
        ),
        child: Row(
          children: [
            _iconContainer,
            Column(
              children: [
                SizedBox(
                  width: 300,
                  child: _title,
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(top: 5),
                  child: _subTitle,
                ),
              ],
            )
          ],
        ),
      );

  get _title {
    //设置富文本
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(searchItem.word, searchModel.keyword ?? ''));
    spans.add(
      TextSpan(
        text: ' ${searchItem.districtname ?? ''} ${searchItem.zonename ?? ''}',
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
    return RichText(text: TextSpan(children: spans));
  }

  get _subTitle => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: searchItem.price ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.orange),
            ),
            TextSpan(
              text: searchItem.star ?? '',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      );

  get _iconContainer => Container(
        margin: const EdgeInsets.all(1),
        child: Image(
          height: 26,
          width: 26,
          image: AssetImage(
            _typeImage(searchItem.type),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.jumpH5(url: searchItem.url, title: '详情');
      },
      child: _item,
    );
  }

  ///根据item数据的类型动弹返回图标
  String _typeImage(String? type) {
    if (type == null) return 'images/type_travelgroup.png';
    String path = 'travelgroup';
    for (final val in types) {
      if (type.contains(val)) {
        path = val;
        break;
      }
    }
    return 'images/type_$path.png';
  }

  ///高亮处理
  List<TextSpan> _keywordTextSpans(String? word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.isEmpty) return spans;

    //搜索关键字高亮处理，忽略大消息
    String wordL = word.toLowerCase(), keywordL = keyword.toLowerCase();
    TextStyle normalStyle =
        const TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle =
        const TextStyle(fontSize: 16, color: Colors.orange);

    // 关键字拆分为数组
    List<String> arr = wordL.split(keywordL);
    int preIndex = 0;
    for (int i = 0; i < arr.length; i++) {
      if (i != 0) {
        //搜索关键字高亮忽略大小写
        preIndex = wordL.indexOf(keywordL, preIndex);
        spans.add(
          TextSpan(
            text: word.substring(preIndex, preIndex + keyword.length),
            style: keywordStyle,
          ),
        );
      }
      String val = arr[i];
      if (val.isNotEmpty) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }
}
