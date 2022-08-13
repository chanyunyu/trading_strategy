import 'package:dio/dio.dart';
import 'package:trading_strategy/network/network.dart';
import 'package:trading_strategy/stock/data/daily_stock_data.dart';

class TradingStrategyNetwork {
  static Future<DailyStockListData> loadStockListData({
    required String stockCode,
    String period = 'daily',
    required String startDate,
    String? endDate,
    String adjust = 'qfq',
  }) async {
    DateTime dateTime = DateTime.now();
    endDate ??= '${dateTime.year}${dateTime.month.toString().padLeft(2, '0')}${dateTime.day.toString().padLeft(2, '0')}';
    Response result = await dio.get(
      '$mainServerAddress/stock_zh_a_hist',
      queryParameters: {
        'symbol': stockCode,
        'period': period,
        'start_date': startDate,
        'end_date': endDate,
        'adjust': adjust,
      },
    );
    return DailyStockListData.fromJson(result.data);
  }
}
