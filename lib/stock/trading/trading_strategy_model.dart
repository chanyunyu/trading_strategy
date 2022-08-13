import 'package:flutter/material.dart';
import 'package:trading_strategy/data/data.dart';
import 'package:trading_strategy/stock/data/data.dart';
import 'package:trading_strategy/stock/trading/strategy/trading_strategy.dart';
import 'package:trading_strategy/stock/trading/trading_strategy_network.dart';

class TradingStrategyModel extends ChangeNotifier with ListDataModel<DailyStockListData> {
  String stockCode;
  TradingStrategy tradingStrategy = TradingStrategy();

  TradingStrategyModel({required this.stockCode}) {
    init(emptyData: DailyStockListData());
  }

  @override
  Future<DailyStockListData> loadFromNetwork() => TradingStrategyNetwork.loadStockListData(
        stockCode: stockCode,
        startDate: '20220101',
      );

  simulateStrategy() async {
    for (var element in source.data) {
      tradingStrategy.executeStrategy(element);
    }
    notifyListeners();
  }
}
