import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/login.dart';

class signup extends StatelessWidget {
  signup({super.key});

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
              "Sign UP  ",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sing Up ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "User Name ",
                      prefix: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(Icons.person)),
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
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Failed is Required";
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "formite  password  ",
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
                                .createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => login(),
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("successfuly"),
                            ));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text("The password provided is too weak"),
                              ));
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    "The account already exists for that email."),
                              ));
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      child: Text(
                        "Sign Up ",
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
                      Text(" Already have an account "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => login(),
                                ));
                          },
                          child: Text("login")),
                    ],
                  )
                ],
              )),
        ));
  }
}
