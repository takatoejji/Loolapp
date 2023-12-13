import 'dart:convert';

import 'package:qr_flutter/qr_flutter.dart';

class Qr_coder {
  String qrcodegen(Map<String, dynamic> data, prediction) {
    return (jsonEncode({"laptop": data, "prediction": prediction}));
  }

  Map<String, dynamic> qrcodereader(String data) {
    return (jsonDecode(data));
  }
}
