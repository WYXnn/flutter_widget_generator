import 'package:event_bus/event_bus.dart';
export 'dart:async';

class EventBusUtil {
  static final EventBusUtil _gInstance = EventBusUtil._init();

  EventBus _eventBus = EventBus();

  EventBusUtil._init() {}

  factory EventBusUtil() {
    return _gInstance;
  }

  EventBus get bus {
    return _eventBus;
  }

}

class changeSearchWord {
  String searchWord;
  changeSearchWord(this.searchWord);
}

class changeImgFilter {
  Map imgFilterEntity;
  changeImgFilter(this.imgFilterEntity);
}

class refresh{}

class changeVideoFilter {
  Map videoFilterEntity;
  changeVideoFilter(this.videoFilterEntity);
}

class changeNewsFilter {
  Map newsFilterEntity;
  changeNewsFilter(this.newsFilterEntity);
}

class updateAppBar {
  bool change;

  updateAppBar(this.change);
}

class maskAppBar {
  bool maskBar;

  maskAppBar(this.maskBar);
}

class maskBody {
  bool maskAppBody;

  maskBody(this.maskAppBody);
}