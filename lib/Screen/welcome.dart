import 'package:firebase/Screen/about_us.dart';
import 'package:firebase/Screen/home_page.dart';
import 'package:firebase/Screen/logIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  // Color.fromARGB(240, 255, 158, 120),
                  Color.fromARGB(171, 255, 255, 255),
                  Color.fromARGB(255, 0, 187, 255),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.10),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Bath-Mate',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 11, 150, 181)),
                    ),
                    // style: TextStyle(
                    //   fontFamily: "Gabarito",
                    //   fontWeight: FontWeight.w300,
                    //   fontSize: 29,
                    //   color: Colors.white70,
                    // ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Color.fromARGB(255, 255, 215, 199)),
                  ),
                  Positioned(
                    bottom: 2000,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 40, right: 40, top: 5, bottom: 40),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => LogIn()));
                        },
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            // color: Color.fromARGB(255, 255, 215, 199),
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Center(
                            child: Text(
                              'Get Started >>',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 2000,
                  //   left: 0,
                  //   right: 0,
                  //   child: Padding(
                  //     padding: EdgeInsets.only(
                  //         left: 40, right: 40, top: 5, bottom: 40),
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         Navigator.pushReplacement(context,
                  //             MaterialPageRoute(builder: (_) => Aboutus()));
                  //       },
                  //       child: Container(
                  //         height: 50,
                  //         // decoration: const BoxDecoration(
                  //         //   // color: Color.fromARGB(255, 255, 215, 199),
                  //         //   color: Color.fromARGB(255, 255, 255, 255),
                  //         //   borderRadius: BorderRadius.all(Radius.circular(30)),
                  //         // ),
                  //         child: Center(
                  //           child: Text(
                  //             'About Us',
                  //             style: GoogleFonts.poppins(
                  //               textStyle: const TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 10,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
