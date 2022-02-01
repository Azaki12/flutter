import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeCodeScreen extends StatefulWidget {
  @override
  _NativeCodeScreenState createState() => _NativeCodeScreenState();
}

class _NativeCodeScreenState extends State<NativeCodeScreen> {
  // creating channel between the flutter and the android and ios hosts
  // name in the String can be changed
  static const platform = MethodChannel('samples.flutter.dev/battery');

  // the underscore (_) makes the variable private
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    platform.invokeMethod('getBatteryLevel').then((value) {
      setState(() {});
      _batteryLevel = 'Battery level at $value % .';
    }).catchError((onError) {
      setState(() {});
      _batteryLevel = "Failed to get battery level: '${onError.message}'.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
