import 'dart:convert';
import '../screens/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  bool _isobscur = true;
  var size;
  var statusCode;
  // TextEditingController name = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();

  void postSignUpData(BuildContext context) async {
    const url = "http://10.0.2.2:8000/api/user/regiser/";
    try {
      var res = await http.post(Uri.parse(url),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: json.encode({
            "name": _name,
            "email": _email,
            "password": _password,
          }));
      if (res.statusCode == 201) {
        print(json.decode(res.body));
        Navigator.pushNamed(context, 'homepage');
      } else {
        setState(() {
          statusCode = res.statusCode;
        });
        print(json.decode(res.body));
        print(res.statusCode);
      }
    } catch (error) {
      print("The error is: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // SingleChildScrollView(
        //   child:
        Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
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
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.09,
              ),
              child: const Text(
                "Create\nAccount",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25,
                  left: MediaQuery.of(context).size.width * 0.09,
                  right: MediaQuery.of(context).size.width * 0.09,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            hintText: "Name",
                            hintStyle: const TextStyle(color: Colors.white),
                            fillColor: Colors.transparent,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onSaved: ((value) {
                          _name = value;
                        }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          hintText: "Email",
                          hintStyle: const TextStyle(color: Colors.white),
                          fillColor: Colors.transparent,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return 'Invalid email';
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
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            hintText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isobscur = !_isobscur;
                                  });
                                },
                                icon: Icon(_isobscur
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            hintStyle: const TextStyle(color: Colors.white),
                            fillColor: Colors.transparent,
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
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: preferconst_literals_to_create_immutables
                        children: [
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 28.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: const Color(0xff4c505b),
                            child: IconButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  postSignUpData(context);
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
                        height: 5,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "login");
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 20,
                                      color: Colors.white),
                                )),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // if (statusCode == 404) ...[
                            //   Container(
                            //     width: double.infinity,
                            //     height: 45,
                            //     decoration: const BoxDecoration(
                            //       color: Colors.red,
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(20)),
                            //     ),
                            //     child: Padding(
                            //       padding:
                            //           const EdgeInsets.symmetric(vertical: 15),
                            //       child: Row(
                            //         children: const [
                            //           Padding(
                            //             padding: EdgeInsets.symmetric(
                            //                 horizontal: 10.0),
                            //             child: Icon(
                            //               Icons.cancel_outlined,
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //           Text(
                            //             'Credentials are incorrect',
                            //             style: TextStyle(
                            //                 color: Colors.white,
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: 15),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ] else ...[
                            //   Container(
                            //     width: double.infinity,
                            //     height: 50,
                            //     color: Colors.transparent,
                            //   )
                            // ],
                          ])
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    // );
  }
}
