// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ListGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widget_generator/base/BaseWidget.dart';

class TestWidget extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return _TestState();
  }
}

class _TestState extends BaseWidgetState {
  int itemCount;

  @override
  void getData() {
    //TODO
  }

  @override
  Future<void> refreshData() async {
    // TODO: implement refreshData
  }

  @override
  Widget buildWidget(BuildContext context) {
    ///if获取到数据
    if (true) {
      return RefreshIndicator(
          child: ListView.separated(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              ///如果到了页尾
              if (true) {
                ///可以继续获取数据
                if (true) {
                  ///获取数据
                  getData();

                  ///加载时显示loading
                  return getLoadingList();
                } else {
                  ///已经加载了所有数据，不再获取数据。
                  return getNoMoreData();
                }
              }

              ///列表项
              return getItem();
            },
            separatorBuilder: (context, index) => Divider(height: 0.8),
          ),
          onRefresh: refreshData);
    } else {
      ///获取数据中loading
      return getLoadingPage();
    }
  }

  Widget getItem() {
    // TODO
  }
}
