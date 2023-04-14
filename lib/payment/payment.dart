import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class RazorPay {
  static bool status;
  static String referenceCode;
  static String orderId;
  static Future<String> makeOrder(int amount) async {
    String username = 'rzp_test_rYbJdIhtq0E1Ot';
    String password = 'vdMU2Nk8Bibp9Gx0ONBlmoNH';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var uri = Uri.parse("https://api.razorpay.com/v1/orders");
    var response;

    try {
      response = await http.post(uri,
          headers: {HttpHeaders.authorizationHeader: basicAuth, HttpHeaders.contentTypeHeader: 'application/json'},
          body: json.encode({"amount": amount, "currency": "GHS", "receipt": "rcptid_11"}));

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        status = true;
        var data = json.decode(response.body);
        referenceCode = data['reference'];
        orderId = data['id'];
        print(referenceCode);

        return referenceCode;
      } else {
        status = false;
        var data = jsonDecode(response.body);
        print(data);
      }
    } catch (e) {
      status = false;
    }
    return "";
  }
}
