import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AlertsTab extends StatefulWidget {
  const AlertsTab({super.key});

  @override
  State<AlertsTab> createState() => _AlertsTabState();
}

class _AlertsTabState extends State<AlertsTab> {
  final List<Map<String, dynamic>> _alerts = [
    {'coin': 'BTC', 'threshold': '> \$65,000', 'enabled': true},
    {'coin': 'ETH', 'threshold': '< \$3,300', 'enabled': false},
    {'coin': 'SOL', 'threshold': '> \$160', 'enabled': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Price Alerts'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ..._alerts.map((alert) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: SwitchListTile(
                title: Text('${alert['coin']} Threshold', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Alert when ${alert['threshold']}', style: const TextStyle(color: AppTheme.textSecondary)),
                value: alert['enabled'] as bool,
                activeColor: AppTheme.primary,
                onChanged: (val) {
                  setState(() => alert['enabled'] = val);
                },
              ),
            );
          }),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Custom alert added!')));
            },
            icon: const Icon(Icons.add_alert_rounded),
            label: const Text('Create New Alert'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
