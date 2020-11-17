import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_generator/base/loading_widget.dart';

abstract class BaseUtil{

  BuildContext _context;
  State _baseState;

  void initBase(State state){
    _baseState = state;
    _context = _baseState.context;
  }

  String getWidgetName() {
    if (_context == null) {
      return "";
    }
    String className = _context.toString();
    if (className == null) {
      return "";
    }

    if (!bool.fromEnvironment("dart.vm.product")) {
      try {
        className = className.substring(0, className.indexOf("("));
      } catch (e) {
        className = "";
      }
      return className;
    }

    return className;
  }

  void onCreate(){}

  void onResume(){}

  void onPause(){}

  void onDestory(){}

  Widget getLoadingPage(){
    return LoadingWidget.getLoadingTop();
  }

  Widget getLoadingList(){
    return LoadingWidget.getLoadingList();
  }

  Widget getNoMoreData(){
    return LoadingWidget.noMoreData();
  }

  Widget getNoData(){
    return LoadingWidget.noData();
  }

  Widget getNullWidget(){
    return Container(height: 0,width: 0);
  }

}