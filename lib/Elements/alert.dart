import 'package:flutter/material.dart';

void alert(context, String message, {buttonText = 'Close'}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Column(mainAxisSize: MainAxisSize.min, children: [
          Center(child: Text(message)),
          SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(buttonText))
        ]));
      });
}

void alertTwo(context, String message, Future onPressed) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(onPressed: () => onPressed, child: Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"))
          ],
        );
      });
}
