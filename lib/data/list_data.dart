import 'package:flutter/material.dart';

import 'single_data.dart';

mixin ListData<T extends Data> {
  final List<T> _data = [];

  List<T> get data => _data;

  int get itemCount => data.length;

  bool get isEmpty => itemCount == 0;

  @mustCallSuper
  clear() => data.clear();

  @mustCallSuper
  add(T newData) => _data.add(newData);

  @mustCallSuper
  remove(T data) => _data.remove(data);

  @mustCallSuper
  insert(int index, T newData) => _data.insert(index, newData);

  @mustCallSuper
  insertAll(int index, List<T> newData) => _data.insertAll(index, newData);

  combine(other) {
    int originLength = _data.length;
    _data.removeWhere((element) => other._data.contains(element));
    _data.addAll(other._data);
    return _data.length - originLength;
  }

  String get loadMoreIdentifier => '';

  fromJson(List<dynamic> json);
}

class EmptyListData with ListData {
  @override
  fromJson(List json) {}
}
