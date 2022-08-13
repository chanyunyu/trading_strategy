import 'package:flutter/material.dart';
import 'package:trading_strategy/data/data.dart';
import 'package:trading_strategy/stock/data/data.dart';
import 'package:trading_strategy/stock/trading/trading_strategy_network.dart';

class TradingStrategyModel extends ChangeNotifier with ListDataModel<DailyStockListData> {
  String stockCode;

  TradingStrategyModel({required this.stockCode}) {
    init(emptyData: DailyStockListData());
  }

  @override
  Future<DailyStockListData> loadFromNetwork() => TradingStrategyNetwork.loadStockListData(
        stockCode: stockCode,
        startDate: '20220101',
      );
}
