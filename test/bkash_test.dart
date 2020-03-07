import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bkash/bkash.dart';

void main() {
  const MethodChannel channel = MethodChannel('bkash');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Bkash.platformVersion, '42');
  });
}
