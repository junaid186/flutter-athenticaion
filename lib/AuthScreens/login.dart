import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool _isobscur = true;
  List non_field_error = ["error: please try again letter"];
  var statuscode;

  void Login(BuildContext context) async {
    const url = 'http://10.0.2.2:8000/api/user/login/';
    try {
      var res = await http.post(Uri.parse(url),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: json.encode({
            'email': _email,
            'password': _password,
          }));
      if (res.statusCode == 200) {
        print(res.statusCode);
        print(json.decode(res.body));
        Navigator.pushNamed(context, 'homepage');
      } else {
        setState(() {
          statuscode = res.statusCode;
        });
        print(res.statusCode);
        statuscode = res.statusCode;
        Map<String, dynamic> Errorresponse = json.decode(res.body);
        print(Errorresponse);
        Map<String, dynamic> error = Errorresponse['error'];
        print(error);
        setState(() {
          non_field_error = error['non_field_errors'];
          print(non_field_error);
        });
      }
    } catch (error) {
      print("The error is: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.12,
                left: MediaQuery.of(context).size.width * 0.09,
              ),
              child: const Text(
                "Welcome\nBack",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.45,
                  left: MediaQuery.of(context).size.width * 0.09,
                  right: MediaQuery.of(context).size.width * 0.09,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email",
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: _isobscur,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isobscur = !_isobscur;
                                  });
                                },
                                icon: Icon(_isobscur
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            hintText: "Password",
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                            return 'Password is too short';
                          }
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w700),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff4c505b),
                            child: IconButton(
                              onPressed: () {
                                var validate =
                                    _formKey.currentState!.validate();

                                if (validate) {
                                  try {
                                    _formKey.currentState!.save();
                                    Login(context);
                                  } catch (error) {
                                    print("The error is: $error");
                                  }
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "signup");
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Color(0xff4c505b)),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "forgotpassword");
                              },
                              child: const Text(
                                "Forget Password",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Color(0xff4c505b)),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (statuscode == 404) ...[
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Credentials are incorrect',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ] else ...[
                        Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.transparent,
                        )

                        // Container(
                        //   width: double.infinity,
                        //   height: 40,
                        //   child: Text(
                        //     non_field_error.toString(),
                        //     style: TextStyle(color: Colors.red, fontSize: 15),
                        //   ),
                        // ),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
