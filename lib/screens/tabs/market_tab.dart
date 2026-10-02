import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class MarketTab extends StatelessWidget {
  const MarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    final assets = [
      {'name': 'Bitcoin', 'sym': 'BTC', 'price': '\$64,820', 'chg': '+3.4%', 'pos': true},
      {'name': 'Ethereum', 'sym': 'ETH', 'price': '\$3,490', 'chg': '+2.1%', 'pos': true},
      {'name': 'Solana', 'sym': 'SOL', 'price': '\$152.4', 'chg': '+5.8%', 'pos': true},
      {'name': 'Cardano', 'sym': 'ADA', 'price': '\$0.48', 'chg': '-1.2%', 'pos': false},
      {'name': 'Ripple', 'sym': 'XRP', 'price': '\$0.59', 'chg': '+0.9%', 'pos': true},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Live Market Watch'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: assets.length,
        itemBuilder: (ctx, i) {
          final a = assets[i];
          final isPos = a['pos'] as bool;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.primary.withValues(alpha: 0.2),
                child: Text(a['sym'] as String, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primary)),
              ),
              title: Text(a['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(a['sym'] as String, style: const TextStyle(color: AppTheme.textSecondary)),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(a['price'] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    a['chg'] as String,
                    style: TextStyle(color: isPos ? Colors.greenAccent : Colors.redAccent, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
