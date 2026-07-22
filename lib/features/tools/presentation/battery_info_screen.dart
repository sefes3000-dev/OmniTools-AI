import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryInfoScreen extends StatefulWidget {
  const BatteryInfoScreen({super.key});

  @override
  State<BatteryInfoScreen> createState() => _BatteryInfoScreenState();
}

class _BatteryInfoScreenState extends State<BatteryInfoScreen> {
  final Battery _battery = Battery();
  int _batteryLevel = 0;
  BatteryState _batteryState = BatteryState.unknown;

  @override
  void initState() {
    super.initState();
    _getBatteryInfo();
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() => _batteryState = state);
    });
  }

  Future<void> _getBatteryInfo() async {
    final level = await _battery.batteryLevel;
    final state = await _battery.batteryState;
    setState(() {
      _batteryLevel = level;
      _batteryState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Battery Information')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _batteryState == BatteryState.charging
                  ? Icons.battery_charging_full
                  : Icons.battery_full,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 20),
            Text(
              '$_batteryLevel%',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Status: ${_batteryState.name.toUpperCase()}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _getBatteryInfo,
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
