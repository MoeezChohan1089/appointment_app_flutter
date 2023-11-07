import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telekonsul/provider/doctor_provider.dart';
import 'package:telekonsul/provider/patient_provider.dart';
import 'package:telekonsul/utils/app_theme.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  Razorpay razorpay = new Razorpay();
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    Provider.of<PatientProvider>(context, listen: false).getAllPatient(
      Provider.of<DoctorProvider>(context, listen: false).doctor!.uid,
    );
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout(){
    var options = {
      "key" : "rzp_test_VTThD0stL2yWuI",
      "amount" : num.parse(textEditingController.text)*100,
      "name" : "Consultation App",
      "description" : "Payment for the some random product",
      "prefill" : {
        "contact" : "5657665767",
        "email" : "moeezchohan798@gmail.com"
      },
      "external" : {
        "wallets" : ["paytm"]
      }
    };

    try{
      razorpay.open(options);
      print("Yes ok this is working");

    }catch(e){
      print(e.toString());
      print("no this is a creating error");
    }

  }

  void handlerPaymentSuccess(){
    print("Payment success");
    Fluttertoast.showToast(msg: 'Payment success', );
  }

  void handlerErrorFailure(){
    print("Payment error");
    Fluttertoast.showToast(msg: 'Payment error');
  }

  void handlerExternalWallet(){
    print("External Wallet");
    Fluttertoast.showToast(msg: 'External Wallet');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razor Pay Tutorial"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  hintText: "amount to pay"
              ),
            ),
            SizedBox(height: 12,),
            RaisedButton(
              color: AppTheme.dangerColor,
              child: Text("Donate Now", style: TextStyle(
                  color: Colors.white
              ),),
              onPressed: (){
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}
