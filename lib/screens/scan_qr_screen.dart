import 'package:ecopouce_screens/helpers/qr_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScanQrScreen extends StatefulWidget {
  static const routeName = '/qr_reader';
  @override
  _ScanQrScreenState createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  String data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouvelle course'),
      ),
      body: Center(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Borne de départ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          // Center(
          //   child: Container(
          //       width: 100,
          //       height: 100,
          //       child: Image.asset('assets/images/eco_pouce_voiture_rvb.png')),
          // ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Scannez le code QR de la borne de départ pour créer une nouvelle course',
              style: TextStyle(fontSize: 15,),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          FloatingActionButton.extended(
            label: Text('Scanner'),
            icon: Icon(Icons.qr_code_scanner_outlined),
            onPressed: () {
              scan().then((value) {
                // Provider.of<Rides>(context, listen: false)
                // .addMeetTime(value);
              });
            },
          ),
        ],
      )),
    );
  }
}


