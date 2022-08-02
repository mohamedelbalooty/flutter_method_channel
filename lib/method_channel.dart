import 'package:flutter/services.dart';

class FlutterMethodChannel {
  final platform = const MethodChannel('mohamed/gamal/calculation');

  Future<String> getSummation({required int num1, required int num2}) async {
    try {
      final int result = await platform.invokeMethod(
          'calculate', <String, dynamic>{'num1': num1, 'num2': num2});
      return result.toString();
    } on PlatformException catch (e) {
      print(e.message);
      return 'Something went wrong';
    }
  }
}
