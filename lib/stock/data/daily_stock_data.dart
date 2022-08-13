import 'package:trading_strategy/data/data.dart';

import 'stock_data.dart';

class DailyStockData with StockData, Data {
  late String date;

  @override
  fromJson(Map<String, dynamic> json) {
    date = json['日期'];
    start = json['开盘'];
    end = json['收盘'];
    max = json['最高'];
    min = json['最低'];
  }
}

class DailyStockListData with ListData<DailyStockData> {
  @override
  fromJson(List json) {
    for (var element in json) {
      add(DailyStockData().fromJson(element));
    }
  }
}
