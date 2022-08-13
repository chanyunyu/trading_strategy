import 'package:flutter/material.dart';

import 'single_data.dart';

mixin SingleDataModel<T extends Data> on ChangeNotifier {
  late T _data;

  T get data => _data;

  init({T? emptyData}) async {
    if (emptyData != null) {
      _data = emptyData;
    }
    T? newData = await loadFromNetwork();
    if (newData != null) {
      _data = newData;
    }
    await onInitComplete();
    notifyListeners();
  }

  onInitComplete() async {}

  refresh() async => init();

  Future<T?> loadFromNetwork();
}
