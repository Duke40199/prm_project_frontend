import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';

class QrScanScreen extends StatefulWidget {
  @override
  _QrScanState createState() => new _QrScanState();
}

class _QrScanState extends State<QrScanScreen> {
  String barcode = "";

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        this.barcode = barcode;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
