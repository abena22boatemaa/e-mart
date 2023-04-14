import 'package:flutter/material.dart';
import 'package:flutter_app/Elements/loading.dart';
import 'package:flutter_app/pages/authentication/signUp.dart';
import 'package:flutter_app/pages/dashboard.dart';
import 'package:flutter_app/services/auth.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool validate = false;
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5663ff),
      body: Center(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 1000,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Login',
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value.isEmpty) return "Please enter your email";
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.vpn_key),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              icon: Icon(Icons.remove_red_eye,
                                  color: obscurePassword ? Color(0xFF484848) : Theme.of(context).primaryColor),
                            )),
                        validator: (value) {
                          if (value.isEmpty) return "Please enter your password";
                          return null;
                        },
                      )
                    ],
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    loader(context);
                    dynamic result = await _auth.logIn(emailController.text, passwordController.text, context);
                    if (result == null) {
                      print('login failed');
                    } else {
                      print('logged in');
                      print(result);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                    }
                  }
                },
                child: Text('Login'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "Signup",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
