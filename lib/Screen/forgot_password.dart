import 'package:firebase/Screen/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  TextEditingController mailcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Password Reset Email has been sent !",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No user found for that email.",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/aduhh.png',
                // width: 450,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "For password recovery, please enter your email :",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // Text(
            //   "Enter your mail",
            //   style: GoogleFonts.poppins(
            //     textStyle: TextStyle(
            //       fontSize: 14,
            //       color: Colors.black,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 207, 218, 223),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          controller: mailcontroller,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  fontSize: 18.0,
                                  color:
                                      const Color.fromARGB(255, 178, 183, 191)),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 178, 183, 191),
                                size: 25.0,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                            });
                            resetPassword();
                          }
                        },
                        child: Container(
                          width: 10,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 114, 171),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Send Email",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Create",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 0, 114, 171),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
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
