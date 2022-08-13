import 'package:dio/dio.dart';
import 'package:trading_strategy/network/network.dart';
import 'package:trading_strategy/stock/data/daily_stock_data.dart';

class TradingStrategyNetwork {
  static Future<DailyStockListData> loadDailyStockListData({
    required String stockCode,
  }) async {
    Response result = await dio.get(
      '$mainServerAddress/stock_zh_a_hist',
      queryParameters: {'symbol': stockCode},
    );
    return DailyStockListData.fromJson(result.data);
  }
}
