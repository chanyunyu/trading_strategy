import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading_strategy/data/data.dart';
import 'package:trading_strategy/data/list_data_widget.dart';
import 'package:trading_strategy/stock/stock.dart';
import 'package:trading_strategy/stock/trading/strategy/strategy.dart';

class TradingStrategyPage extends StatefulWidget {
  const TradingStrategyPage({Key? key}) : super(key: key);

  @override
  State<TradingStrategyPage> createState() => _TradingStrategyPageState();
}

class _TradingStrategyPageState extends State<TradingStrategyPage> {
  late String stockCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Map) {
      stockCode = arguments['stockCode'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$stockCode交易策略'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => TradingStrategyModel(stockCode: stockCode),
        builder: (BuildContext context, Widget? child) {
          TradingStrategy tradingStrategy = Provider.of<TradingStrategyModel>(context).tradingStrategy;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Provider.of<TradingStrategyModel>(context, listen: false).simulateStrategy(),
                    child: const Text('开始模拟'),
                  ),
                  Text('总资产：${tradingStrategy.totalAssets}'),
                  Text('现金资产：${tradingStrategy.cashAssets}'),
                  Text('股票资产：${tradingStrategy.stockAssets}'),
                  Text('股票数量：${tradingStrategy.numberOfStock}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('日期'),
                  Text('开盘'),
                  Text('收盘'),
                  Text('最高'),
                  Text('最低'),
                ],
              ),
              Flexible(
                child: ChangeNotifierProvider(
                  create: (BuildContext context) => TradingStrategyModel(stockCode: stockCode),
                  builder: (BuildContext context, Widget? child) {
                    return ListDataWidget<TradingStrategyModel>(
                      builder: buildItem,
                      loadMoreEnable: false,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildItem<T extends ListDataModel>(BuildContext context, int index) {
    DailyStockData data = Provider.of<T>(context).data[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(data.date),
        Text('${data.start}'),
        Text('${data.end}'),
        Text('${data.max}'),
        Text('${data.min}'),
      ],
    );
  }
}
