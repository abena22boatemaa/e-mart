import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/order.dart';
import 'package:flutter_app/models/orderedProduct.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  final Order order;
  final bool admin;
  const Details({Key key, @required this.order, @required this.admin}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool changeStatus = false;
  String dropDownValue;
  @override
  void initState() {
    dropDownValue = widget.order.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var collection = FirebaseFirestore.instance.collection('orders');
    List orderStatus = widget.order.status.split(RegExp(r'(?=[A-Z])'));
    List<OrderedProduct> orderProducts = widget.order.products.map((e) => OrderedProduct.fromJson(e)).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Products', style: TextStyle(color: Theme.of(context).primaryColor)),
              ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: widget.order.products.length,
                  separatorBuilder: (context, ind) {
                    return Divider();
                  },
                  itemBuilder: (context, ind) {
                    return ListTile(
                      title: Text(
                        orderProducts[ind].product.name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount: ${orderProducts[ind].price.toString()}',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Quantity: ${orderProducts[ind].quantity.toString()}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }),
              SizedBox(height: 20),
              Text('Status', style: TextStyle(color: Theme.of(context).primaryColor)),
              widget.admin
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton<String>(
                          value: dropDownValue,
                          dropdownColor: Colors.white,
                          onChanged: (newvalue) {
                            setState(() {
                              dropDownValue = newvalue;
                              changeStatus = true;
                            });
                          },
                          items: ["awaitingPayment", "awaitingDelivery", "completed"]
                              .map<DropdownMenuItem<String>>((String orderStatus) {
                            return DropdownMenuItem<String>(
                              child: Text(
                                orderStatus.toUpperCase(),
                              ),
                              value: orderStatus,
                            );
                          }).toList(),
                        ),
                        Visibility(
                            visible: changeStatus,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "Change order status?",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(Theme.of(context).primaryColor)),
                                        onPressed: () async {
                                          await collection
                                              .doc("${widget.order.id}-${widget.order.orderNo}")
                                              .update({"status": dropDownValue});
                                          setState(() {
                                            changeStatus = false;
                                          });
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<Color>(Theme.of(context).primaryColor)),
                                        onPressed: () {
                                          setState(() {
                                            changeStatus = false;
                                          });
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ))
                      ],
                    )
                  : Text(
                      '${orderStatus.join(' ').toUpperCase()}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
              SizedBox(height: 20),
              Text('Date', style: TextStyle(color: Theme.of(context).primaryColor)),
              Text(
                '${DateFormat('yyyy-MM-dd – kk:mm').format(widget.order.date)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text('Delivery Details', style: TextStyle(color: Theme.of(context).primaryColor)),
              Text(
                '${widget.order.deliveryName}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                '${widget.order.deliveryAddress}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                '${widget.order.deliveryPhoneNumber}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                '${widget.order.deliveryTime}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text('Delivery Fee', style: TextStyle(color: Theme.of(context).primaryColor)),
              Text(
                'GHS ${widget.order.deliveryFee}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text('Total Amount', style: TextStyle(color: Theme.of(context).primaryColor)),
              Text(
                'GHS ${widget.order.amount.toString()}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          )),
    );
  }
}
