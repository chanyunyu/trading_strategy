import 'package:flutter/material.dart';

class TradingStrategyPage extends StatefulWidget {
  const TradingStrategyPage({Key? key}) : super(key: key);

  @override
  State<TradingStrategyPage> createState() => _TradingStrategyPageState();
}

class _TradingStrategyPageState extends State<TradingStrategyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('交易策略'),
      ),
    );
  }
}
