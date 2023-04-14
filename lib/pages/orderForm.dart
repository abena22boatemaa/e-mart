import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Elements/loading.dart';
import 'package:flutter_app/Elements/toast.dart';
import 'package:flutter_app/order/backgroundimage.dart';
import 'package:flutter_app/payment/payment.dart';
import 'package:flutter_app/providers/cartProvider.dart';
import 'package:flutter_app/providers/ordersProvider.dart';
import 'package:flutter_app/utils/global.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/order/color.dart';
import 'package:flutter_app/order/widgets.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final CollectionReference orderCollection = FirebaseFirestore.instance.collection('orders');
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  var _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    return Stack(
      children: [
        Image.asset(
          'images/ord.jpg',
          fit: BoxFit.fitHeight,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xff5663ff),
            title: Text('E-Market'),
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.2,
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'User',
                      fieldController: nameController,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.locationArrow,
                      hint: 'Location',
                      fieldController: locationController,
                      inputType: TextInputType.text,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.phone,
                      hint: 'Phone Number',
                      fieldController: phoneController,
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      icon: FontAwesomeIcons.businessTime,
                      hint: 'Time',
                      fieldController: timeController,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kBlue,
                        ),
                        onPressed: () async {
                          loader(context);
                          await Provider.of<Orders>(context, listen: false).addOrder(
                              cart.items.values.map((e) => e.toJson()).toList(),
                              10,
                              nameController.text,
                              locationController.text,
                              phoneController.text,
                              timeController.text,
                              cart.totalAmount + 10);
                          await RazorPay.makeOrder(((cart.totalAmount + 10) * 100).toInt());
                          if (RazorPay.status) {
                            await openCheckout(
                              cart.totalAmount + 10,
                            );
                          }

                          cart.clear();
                          showToastMessage('Order Made');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text("Submit")),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'will be there in a ',
                          style: kBodyText.copyWith(color: kBlue, fontWeight: FontWeight.bold)
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Jiffy',
                            style: kBodyText.copyWith(color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  openCheckout(num amount) async {
    var options = {
      'key': 'rzp_test_rYbJdIhtq0E1Ot',
      'amount': amount,
      'name': 'E-market Order',
      "order_Id": RazorPay.orderId,
      'description': 'E-market order for ${nameController.text} by${GlobalData.userData.email}',
      'prefill': {'contact': phoneController.text, 'email': GlobalData.userData.email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    await orderCollection.doc("${GlobalData.userData.email}-${GlobalData.noOfOrders ?? 1}").update({
      'razorPayPaymentId': response.paymentId,
      'razorPayOrderId': response.orderId,
      'razorPaySignature': response.signature,
      'status': 'paid'
    });
    showToastMessage("Payment Successful");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showToastMessage("ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    showToastMessage("EXTERNAL_WALLET: " + response.walletName);
  }
}
