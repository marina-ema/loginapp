import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/signup.dart';
import 'package:flutter_application_4/test.dart';

class login extends StatelessWidget {
  login({super.key});

  String? email;
  String? password;
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              "Login   ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Form(
          key: formkey,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Failed is Required";
                      }
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email ",
                      prefix: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(Icons.email)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Failed is Required";
                      }
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "password  ",
                      suffix: Icon(Icons.visibility),
                      prefix: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(Icons.lock)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screentest(),
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("successfuly"),
                            ));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("No user found for that email."),
                              ));
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    "Wrong password provided for that user"),
                              ));
                            }
                          }
                        }
                      },
                      child: Text(
                        "Login  ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Don’t  have an account "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => signup(),
                                ));
                          },
                          child: Text("Sign up")),
                    ],
                  )
                ],
              )),
        ));
  }
}
