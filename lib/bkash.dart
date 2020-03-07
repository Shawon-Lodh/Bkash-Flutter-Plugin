import 'dart:async';

import 'package:flutter/services.dart';

class Bkash {
  static const MethodChannel _channel =
      const MethodChannel('bkash');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  static Future<Map<dynamic, dynamic>> startBkashPayment(
      bool testing,
      String mId,
      String orderId,
      String custId,
      String channelId,
      String txnAmount,
      String website,
      String callBackUrl,
      String industryTypeId,
      String checkSumHash) async {
    Map<dynamic, dynamic> response =
    await _channel.invokeMethod('startBkashPayment', {
      "mId": mId,
      "testing": testing,
      'orderId': orderId,
      'custId': custId,
      'channelId': channelId,
      'txnAmount': txnAmount,
      'website': website,
      'callBackUrl': callBackUrl,
      'industryTypeId': industryTypeId,
      'checkSumHash': checkSumHash
    });

    return response;
  }

}