import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merrymas/main.dart';
import 'package:merrymas/widgets/top_container.dart';

import '../app_color.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String _password = '';
  bool _obscureText = true;

   void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
        children: [
          TopContainer(
              height: 470,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text('Ristek',
                      style: TextStyle(
                          fontSize: 110,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 30,
                  ),
                  Text('USERNAME',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(fillColor: Colors.white, filled: true),
                    onChanged: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },

                    onSaved: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },

                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Username cannot be empty!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('PASSWORD',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(fillColor: Colors.white, filled: true),
                    onChanged: (String? value) {
                      setState(() {
                        _password = value!;
                      });
                    },

                    onSaved: (String? value) {
                      setState(() {
                        _password = value!;
                      });
                    },

                    obscureText: _obscureText,


                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty!';
                      }
                      return null;
                    },


                  ),
                  
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0)),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  validateLogin();
                },
                child: Text('LOGIN'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.ungu,
                )),
          )
        ],
      )),
      )
    );
  }

  void validateLogin() {
    if (username == 'RISTEK' && _password == '12345') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    title: '',
                  )));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
