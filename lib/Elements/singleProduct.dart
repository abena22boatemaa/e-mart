import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;

  SingleProduct({
    this.prodName,
    this.prodPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prodName,
        child: Material(
          child: Container(
            color:Colors.white,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Image.network(
                        prodPicture,
                      ),
                    )),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          prodName,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
