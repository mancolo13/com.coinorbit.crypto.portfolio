import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PortfolioTab extends StatelessWidget {
  const PortfolioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CoinOrbit Portfolio'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total Net Asset Value', style: TextStyle(color: AppTheme.textSecondary)),
                  const SizedBox(height: 8),
                  const Text('\$42,850.25', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.trending_up, color: Colors.greenAccent, size: 20),
                      SizedBox(width: 4),
                      Text('+\$2,410.80 (+5.95%) today', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Watchlist Assets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _assetTile('Bitcoin', 'BTC', '\$64,250.00', '+3.4%'),
          _assetTile('Ethereum', 'ETH', '\$3,480.10', '+4.1%'),
          _assetTile('Solana', 'SOL', '\$154.20', '+8.2%'),
          _assetTile('Ripple', 'XRP', '\$0.58', '-1.2%'),
        ],
      ),
    );
  }

  Widget _assetTile(String name, String symbol, String price, String change) {
    final isPos = change.startsWith('+');
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.surface,
          child: Text(symbol.substring(0, 1), style: const TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(symbol),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(change, style: TextStyle(color: isPos ? Colors.greenAccent : Colors.redAccent, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
