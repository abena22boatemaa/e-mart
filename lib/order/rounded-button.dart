import 'package:flutter/material.dart';
import 'package:flutter_app/order/color.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key key, @required this.buttonName, @required this.onclick}) : super(key: key);

  final String buttonName;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: () => onclick,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
