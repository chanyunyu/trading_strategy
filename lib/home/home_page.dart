import 'package:flutter/material.dart';
import 'package:trading_strategy/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('天天爱做替'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.stockTradingStrategy, arguments: {'stockCode': '688599'});
            },
            child: const Text('天合光能交易测试'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.stockTradingStrategy, arguments: {'stockCode': '300316'});
            },
            child: const Text('晶盛机电交易测试'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.stockTradingStrategy, arguments: {'stockCode': '002129'});
            },
            child: const Text('TCL中环交易测试'),
          ),
        ],
      ),
    );
  }
}
