import 'package:flutter/material.dart';

class LoadingWidget{
  static Widget getLoadingTop(){
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 6),
        child: CircularProgressIndicator(),
      ),
    );
  }

  static Widget getLoadingList(){
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: SizedBox(
          width: 24.0,
          height: 24.0,
          child: CircularProgressIndicator(strokeWidth: 2.0)),
    );
  }

  static Widget noMoreData(){
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Text(
          "没有更多了",
          style: TextStyle(color: Colors.grey),
        ));
  }
  static Widget noData(){
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Text(
          "没有数据",
          style: TextStyle(color: Colors.grey),
        ));
  }
}