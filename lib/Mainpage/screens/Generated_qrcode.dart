import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generated_qrcode extends StatelessWidget {
  const Generated_qrcode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      body: Center(
          child: QrImage(
        data: args,
        version: QrVersions.auto,
        size: 320,
        gapless: false,
      )),
    );
  }
}
