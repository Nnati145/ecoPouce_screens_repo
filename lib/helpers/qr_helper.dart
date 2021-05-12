import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

  Future<String> scan() async {
    String answer = "";

    try {
      String barcode = await BarcodeScanner.scan();

        answer = barcode;

    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {

          answer = 'Camera permission not granted';

      } else {

          answer = 'Unknown error: $e';

      }
    } on FormatException {

        answer = 'null';

    } catch (e) {

        answer = 'Unknown error: $e';

      throw (e);
    }

    return answer;
  }  