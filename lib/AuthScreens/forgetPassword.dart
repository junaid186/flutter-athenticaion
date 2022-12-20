import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var _email;
  var statusCode;
  // TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void EmailSend() async {
    const url = 'http://10.0.2.2:8000/api/user/send-reset-password-email/';
    try {
      var res = await http.post(Uri.parse(url),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
          },
          body: json.encode({
            'email': _email,
          }));
      if (res.statusCode == 200) {
        print(res.statusCode);
        print(json.decode(res.body));
      } else {
        print(res.statusCode);
        print(json.decode(res.body));
        setState(() {
          statusCode = res.statusCode;
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.09,
              ),
              child: const Text(
                "Reset\nPassword",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: MediaQuery.of(context).size.width * 0.09,
                  right: MediaQuery.of(context).size.width * 0.09,
                ),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email",
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       hintText: "Email",
                    //       fillColor: Colors.grey.shade100,
                    //       filled: true,
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(15))),
                    //   controller: _email,
                    // ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff4c505b),
                          child: IconButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                print("The value of _email is: $_email");
                                EmailSend();
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
                      height: 10,
                    ),
                    if (statusCode == 400) ...[
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'This Email is not registered',
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
                    ],

                    //),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
