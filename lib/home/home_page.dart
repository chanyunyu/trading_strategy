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
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.stockTradingStrategy);
        },
        child: const Text('天合光能交易测试'),
      ),
    );
  }
}
