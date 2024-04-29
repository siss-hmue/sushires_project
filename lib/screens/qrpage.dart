import 'package:flutter/material.dart';
import 'package:sushires_project/components/appbackground.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class QRPayment extends StatefulWidget {
  const QRPayment({super.key});

  @override
  State<QRPayment> createState() => _QRPaymentState();
}

class _QRPaymentState extends State<QRPayment> {
  final upiDetails = UPIDetails(
      upiID: "9167877725@axl",
      payeeName: "Agnel Selvan",
      amount: 1,
      transactionNote: "Hello World");
  final upiDetailsWithoutAmount = UPIDetails(
    upiID: "9167877725@axl",
    payeeName: "Agnel Selvan",
    transactionNote: "Hello World",
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'QR Code',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
        ),
        body: SafeArea(
          child: AppBackGround(
            childWidget: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  UPIPaymentQRCode(
                    upiDetails: upiDetails,
                    size: 220,
                    upiQRErrorCorrectLevel: UPIQRErrorCorrectLevel.low,
                  ),
                  Text(
                    "Scan QR to Pay",
                    style:
                        TextStyle(color: Colors.grey[600], letterSpacing: 1.2),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('DONE'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
