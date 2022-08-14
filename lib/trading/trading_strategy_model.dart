import 'package:flutter/material.dart';
import 'package:trading_strategy/data/data.dart';
import 'package:trading_strategy/stock/stock.dart';
import 'package:trading_strategy/trading/strategy/trading_strategy.dart';
import 'package:trading_strategy/trading/trading_strategy_network.dart';

class TradingStrategyModel extends ChangeNotifier with ListDataModel<DailyStockListData> {
  String stockCode;
  TradingStrategy tradingStrategy = TradingStrategy();
  String _period = StockDataPeriod.daily;

  String get period => _period;

  set period(String period) {
    _period = period;
    refresh();
  }

  bool get isDaily => _period == StockDataPeriod.daily;

  bool get isWeekly => _period == StockDataPeriod.weekly;

  bool get isMonthly => _period == StockDataPeriod.monthly;

  TradingStrategyModel({required this.stockCode}) {
    init(emptyData: DailyStockListData());
  }

  @override
  Future<DailyStockListData> loadFromNetwork() => TradingStrategyNetwork.loadStockListData(
        stockCode: stockCode,
        startDate: '20220101',
        period: period,
      );

  simulateStrategy() async {
    for (var element in source.data) {
      tradingStrategy.executeStrategy(element);
    }
    notifyListeners();
  }
}
