import 'BaseWidget.dart';

class WidgetManager {
  List<String> _activityStack = new List<String>();

  WidgetManager._internal();

  static WidgetManager _widgetManager = new WidgetManager._internal();

  factory WidgetManager() => _widgetManager;
  
  void addWidget(BaseWidgetState widgetName) {
    _activityStack.add(widgetName.getWidgetName());
  }

  void removeWidget(BaseWidgetState widgetName) {
    _activityStack.remove(widgetName.getWidgetName());
  }

  bool isTopPage(BaseWidgetState widgetName) {
    if (_activityStack == null) {
      return false;
    }
    try {
      return widgetName.getWidgetName() == _activityStack[_activityStack.length - 1];
    } catch (exception) {
      return false;
    }
  }

  bool isSecondTop(BaseWidgetState widgetName) {
    if (_activityStack == null) {
      return false;
    }
    try {
      return widgetName.getWidgetName() == _activityStack[_activityStack.length - 2];
    } catch (exception) {
      return false;
    }
  }
}