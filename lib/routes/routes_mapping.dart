import 'package:flutter/material.dart';
import 'package:trading_strategy/trading/trading.dart';

import 'routes_constants.dart';

final Map<String, WidgetBuilder> routesMapping = {
  Routes.stockTradingStrategy: (BuildContext context) => const TradingStrategyPage(),
};
