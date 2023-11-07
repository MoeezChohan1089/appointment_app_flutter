import 'package:flutter/material.dart';

class payPalPayment extends StatefulWidget{
  @override
  _payPalPaymentState createState() => _payPalPaymentState();
}

class _payPalPaymentState extends State<payPalPayment> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("Paypal"),
       centerTitle: true,
     ),
     body: Center(
       child: ElevatedButton(
         child: Text('pay'),
         onPressed: () {

         },
       ),
     ),
   );
  }
}