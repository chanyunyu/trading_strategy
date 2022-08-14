import 'package:flutter/material.dart';
import 'package:trading_strategy/stock/stock.dart';

import 'strategy_unit.dart';

class TradingStrategy {
  double cashAssets = 1000000.0;
  int numberOfStock = 0;
  double currentPrice = 0.0;

  double get stockAssets => numberOfStock * currentPrice;

  double get totalAssets => cashAssets + stockAssets;

  List<StrategyUnit> strategy = [
    StrategyUnit(targetPrice: 89, targetNumber: 200),
    StrategyUnit(targetPrice: 88, targetNumber: 200),
    StrategyUnit(targetPrice: 87, targetNumber: 200),
    StrategyUnit(targetPrice: 86, targetNumber: 200),
    StrategyUnit(targetPrice: 85, targetNumber: 200),
    StrategyUnit(targetPrice: 84, targetNumber: 200),
    StrategyUnit(targetPrice: 83, targetNumber: 200),
    StrategyUnit(targetPrice: 82, targetNumber: 200),
    StrategyUnit(targetPrice: 81, targetNumber: 200),
    StrategyUnit(targetPrice: 80, targetNumber: 200),
    StrategyUnit(targetPrice: 79, targetNumber: 300),
    StrategyUnit(targetPrice: 78, targetNumber: 300),
    StrategyUnit(targetPrice: 77, targetNumber: 300),
    StrategyUnit(targetPrice: 76, targetNumber: 300),
    StrategyUnit(targetPrice: 75, targetNumber: 300),
    StrategyUnit(targetPrice: 74, targetNumber: 300),
    StrategyUnit(targetPrice: 73, targetNumber: 300),
    StrategyUnit(targetPrice: 72, targetNumber: 300),
    StrategyUnit(targetPrice: 71, targetNumber: 300),
    StrategyUnit(targetPrice: 70, targetNumber: 400),
    StrategyUnit(targetPrice: 69, targetNumber: 400),
    StrategyUnit(targetPrice: 68, targetNumber: 400),
    StrategyUnit(targetPrice: 67, targetNumber: 400),
    StrategyUnit(targetPrice: 66, targetNumber: 400),
    StrategyUnit(targetPrice: 65, targetNumber: 400),
    StrategyUnit(targetPrice: 64, targetNumber: 400),
    StrategyUnit(targetPrice: 63, targetNumber: 400),
    StrategyUnit(targetPrice: 62, targetNumber: 400),
    StrategyUnit(targetPrice: 61, targetNumber: 400),
    StrategyUnit(targetPrice: 60, targetNumber: 400),
    StrategyUnit(targetPrice: 59, targetNumber: 400),
    StrategyUnit(targetPrice: 58, targetNumber: 400),
    StrategyUnit(targetPrice: 57, targetNumber: 400),
    StrategyUnit(targetPrice: 56, targetNumber: 400),
    StrategyUnit(targetPrice: 55, targetNumber: 400),
    StrategyUnit(targetPrice: 54, targetNumber: 400),
    StrategyUnit(targetPrice: 53, targetNumber: 400),
    StrategyUnit(targetPrice: 52, targetNumber: 400),
    StrategyUnit(targetPrice: 51, targetNumber: 400),
    StrategyUnit(targetPrice: 50, targetNumber: 400),
    StrategyUnit(targetPrice: 49, targetNumber: 500),
    StrategyUnit(targetPrice: 48, targetNumber: 500),
    StrategyUnit(targetPrice: 47, targetNumber: 500),
    StrategyUnit(targetPrice: 46, targetNumber: 500),
    StrategyUnit(targetPrice: 45, targetNumber: 500),
    StrategyUnit(targetPrice: 44, targetNumber: 500),
    StrategyUnit(targetPrice: 43, targetNumber: 500),
    StrategyUnit(targetPrice: 42, targetNumber: 500),
    StrategyUnit(targetPrice: 41, targetNumber: 500),
    StrategyUnit(targetPrice: 40, targetNumber: 500),
    StrategyUnit(targetPrice: 39, targetNumber: 1000),
    StrategyUnit(targetPrice: 38, targetNumber: 1000),
    StrategyUnit(targetPrice: 37, targetNumber: 1000),
    StrategyUnit(targetPrice: 36, targetNumber: 1000),
    StrategyUnit(targetPrice: 35, targetNumber: 1000),
    StrategyUnit(targetPrice: 34, targetNumber: 1000),
    StrategyUnit(targetPrice: 33, targetNumber: 1000),
    StrategyUnit(targetPrice: 32, targetNumber: 1000),
    StrategyUnit(targetPrice: 31, targetNumber: 1000),
    StrategyUnit(targetPrice: 30, targetNumber: 1000),
  ];

  executeStrategy(StockData stockData) {
    currentPrice = stockData.end;
    int changedNumber = 0;
    for (var element in strategy) {
      if (element.targetPrice > currentPrice && element.bought == false) {
        element.bought = true;
        changedNumber += element.targetNumber;
      } else if (element.targetPrice < currentPrice && element.bought == true) {
        element.bought = false;
        changedNumber -= element.targetNumber;
      }
    }
    numberOfStock += changedNumber;
    cashAssets -= changedNumber * currentPrice;
    debugPrint('时间=${stockData.dateTime},当前价=$currentPrice,数量=$numberOfStock,股票资产=$stockAssets,现金资产=$cashAssets,总资产=$totalAssets,当日变动= $changedNumber');
  }
}
