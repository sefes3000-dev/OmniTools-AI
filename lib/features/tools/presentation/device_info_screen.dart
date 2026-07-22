import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  Map<String, String> _deviceData = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadDeviceInfo();
  }

  Future<void> _loadDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    final Map<String, String> data = {};

    try {
      if (Platform.isAndroid) {
        final android = await deviceInfo.androidInfo;
        data['Device Model'] = android.model;
        data['Brand'] = android.brand;
        data['Manufacturer'] = android.manufacturer;
        data['Android Version'] = android.version.release;
        data['SDK Version'] = android.version.sdkInt.toString();
        data['Hardware'] = android.hardware;
      } else if (Platform.isIOS) {
        final ios = await deviceInfo.iosInfo;
        data['Device Name'] = ios.name;
        data['Model'] = ios.model;
        data['System Name'] = ios.systemName;
        data['System Version'] = ios.systemVersion;
      }
    } catch (_) {
      data['Error'] = 'Failed to get device info';
    }

    setState(() {
      _deviceData = data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Information')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: _deviceData.entries.map((e) {
                return Card(
                  child: ListTile(
                    title: Text(e.key, style: const TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text(e.value, style: const TextStyle(fontSize: 16)),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
