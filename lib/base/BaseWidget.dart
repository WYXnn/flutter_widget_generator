import 'package:flutter/material.dart';
import 'package:widget_generator/base/BaseUtil.dart';
import 'package:widget_generator/utils/EventBusUtils/EventBusUtil.dart';

import 'WidgetManager.dart';

abstract class BaseWidget extends StatefulWidget {

  BaseWidgetState baseWidget2State;

  @override
  BaseWidgetState createState(){
    baseWidget2State = getState();
    return baseWidget2State;
  }
  BaseWidgetState getState();
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<BaseWidget> with BaseUtil,WidgetsBindingObserver{

  bool _onResumed = false;
  bool _onPause = false;
  StreamSubscription<refresh> _eventRefresh;

  Widget buildWidget(BuildContext context);

  void refreshData();

  @override
  Widget build(BuildContext context) {
    if (!_onResumed) {
      if (WidgetManager().isTopPage(this)) {
        _onResumed = true;
        onResume();
      }
    }
    return buildWidget(context);
  }

  @override
  void initState() {
    EventBusUtil().bus.on<refresh>().listen((event) {
      if(mounted){
        setState(() {
          refreshData();
        });
      }
    });
    initBase(this);
    WidgetManager().addWidget(this);
    WidgetsBinding.instance.addObserver(this);
    onCreate();
    super.initState();
  }


  @override
  void deactivate() {
    if (WidgetManager().isSecondTop(this)) {
      if (!_onPause) {
        onPause();
        _onPause = true;
      } else {
        onResume();
        _onPause = false;
      }
    } else if (WidgetManager().isTopPage(this)) {
      if (!_onPause) {
        onPause();
      }
    }
    super.deactivate();
  }

  @override
  void dispose() {
    onDestory();
    WidgetsBinding.instance.removeObserver(this);
    _onResumed = false;
    _onPause = false;
    WidgetManager().removeWidget(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //on resume
      if (WidgetManager().isTopPage(this)) {
        onResume();
      }
    } else if (state == AppLifecycleState.paused) {
      //on pause
      if (WidgetManager().isTopPage(this)) {
        onPause();
      }
    }
    super.didChangeAppLifecycleState(state);
  }

}
