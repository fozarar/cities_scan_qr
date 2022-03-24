import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intesasoft_case_study/screens/home_screen.dart';
import 'package:intesasoft_case_study/widgets/custom_appbar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/controller.dart';

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({Key? key}) : super(key: key);

  @override
  State<ScannerWidget> createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  CitiesController c = Get.find();
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: CustomAppbar(),
        preferredSize: Size.fromHeight(70),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(bottom: 10, child: buildResult())
        ],
      ),
    );
  }

  Widget buildResult() => Container(
        color: Colors.white,
        child: Text(
          barcode != null ? 'Result : ${barcode!.code}' : 'Scan a code',
          maxLines: 3,
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
          print(barcode.code);
          c.qrVal.value = barcode.code!;
          Future.delayed(const Duration(seconds: 1), () {
            Get.back();
          });
        }));
  }
}
