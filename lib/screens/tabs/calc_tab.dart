import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class CalcTab extends StatefulWidget {
  const CalcTab({super.key});

  @override
  State<CalcTab> createState() => _CalcTabState();
}

class _CalcTabState extends State<CalcTab> {
  double _buyPrice = 50000;
  double _sellPrice = 65000;
  double _amount = 0.5;

  @override
  Widget build(BuildContext context) {
    final investment = _buyPrice * _amount;
    final totalReturn = _sellPrice * _amount;
    final profit = totalReturn - investment;
    final roi = investment > 0 ? (profit / investment) * 100 : 0.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Profit & ROI Simulator'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('Net Projected Profit', style: TextStyle(color: AppTheme.textSecondary)),
                  const SizedBox(height: 8),
                  Text('\$${profit.toStringAsFixed(2)}', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: profit >= 0 ? AppTheme.primary : Colors.redAccent)),
                  Text('ROI: ${roi.toStringAsFixed(2)}%', style: TextStyle(color: profit >= 0 ? Colors.greenAccent : Colors.redAccent, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Buy Price: \$${_buyPrice.round()}'),
                  Slider(value: _buyPrice, min: 1000, max: 100000, activeColor: AppTheme.primary, onChanged: (v) => setState(() => _buyPrice = v)),
                  Text('Target Sell Price: \$${_sellPrice.round()}'),
                  Slider(value: _sellPrice, min: 1000, max: 150000, activeColor: AppTheme.primary, onChanged: (v) => setState(() => _sellPrice = v)),
                  Text('Coin Quantity: ${_amount.toStringAsFixed(2)}'),
                  Slider(value: _amount, min: 0.01, max: 5.0, divisions: 50, activeColor: AppTheme.primary, onChanged: (v) => setState(() => _amount = v)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
