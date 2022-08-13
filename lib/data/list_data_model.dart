import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'list_data.dart';
import 'single_data.dart';

mixin ListDataModel<T extends ListData> on ChangeNotifier {
  final EasyRefreshController controller = EasyRefreshController();
  int _page = 1;

  int get page => _page;

  late T _data;

  T get source => _data;

  set source(T data) => _data = data;

  List<Data> get data => _data.data;

  int get itemCount => _data.itemCount;

  bool get isEmpty => _data.isEmpty;

  init({T? emptyData}) async {
    if (emptyData != null) {
      _data = emptyData;
    }
    await refresh();
    await onInitComplete();
  }

  onInitComplete() async {}

  refresh({bool forceRefresh = true}) async {
    _page = 1;
    T newData = await loadFromNetwork();
    if (newData.itemCount > 0 || forceRefresh) {
      _data = newData;
      controller.finishRefresh();
      controller.finishLoad(noMore: newData.itemCount == 0);
      await onDataChanged();
      notifyListeners();
    }
  }

  Future<int> loadMore() async {
    _page++;
    T newData = await loadFromNetwork();
    int newItemCount = _data.combine(newData);
    controller.finishLoad(noMore: newItemCount == 0);
    if (itemCount > 0 && newItemCount == 0) {
      BotToast.showText(text: '没有更多了');
    }
    await onDataChanged();
    notifyListeners();
    return newItemCount;
  }

  onDataChanged() async {}

  Future<T> loadFromNetwork();

  update() => notifyListeners();

  @mustCallSuper
  remove(data) {
    _data.remove(data);
    notifyListeners();
  }
}
