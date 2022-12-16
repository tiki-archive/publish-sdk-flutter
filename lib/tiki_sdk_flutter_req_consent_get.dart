/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dart:convert';

import 'package:tiki_sdk_flutter/tiki_sdk_flutter_req.dart';

class TikiSdkFlutterReqConsentGet extends TikiSdkFlutterReq {
  late String source;
  String? origin;

  @override
  late String requestId;

  TikiSdkFlutterReqConsentGet.fromJson(String jsonReq) {
    Map<String, String> map = jsonDecode(jsonReq);
    source = map["source"]!;
    requestId = map["requestId"]!;
    origin = map["origin"];
  }
}