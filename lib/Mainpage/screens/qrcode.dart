import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interfaces/Mainpage/model/qrcodem.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QRCODESCANNER extends StatefulWidget {
  const QRCODESCANNER({Key key}) : super(key: key);

  @override
  State<QRCODESCANNER> createState() => _QRCODESCANNERState();
}

class _QRCODESCANNERState extends State<QRCODESCANNER> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;
  Qr_coder resp = Qr_coder();
  Map<String, String> stringQueryParameters = Map<String, String>();

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null) ? Text('${result.code}') : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print(result.code);
      });
      stringQueryParameters = resp.qrcodereader(result.code).map((key, value) => MapEntry(key, value?.toString()));
      _onBasicAlertPressed(context, stringQueryParameters);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  _onBasicAlertPressed(context, resp) {
    Alert(context: context, title: "Predicted price", desc: resp).show();
  }
}
