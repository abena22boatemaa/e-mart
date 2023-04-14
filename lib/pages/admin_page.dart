import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/pages/authentication/login.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Admin Page',
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:()async{
        await _auth.signOut();
        print('logout successful');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
      },
      child: Text('Log out'),
      ),

    );
  }
}
