import 'dart:ui';
import 'package:firebase/Screen/drawer.dart';
import 'package:firebase/Screen/home_page.dart';
import 'package:firebase/Screen/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase/Screen/user_guide.dart';
import 'package:firebase/Firebase/auth.dart';
import 'package:firebase/Screen/welcome.dart';
import 'package:firebase/Screen/emer_number.dart';
import 'package:firebase/Screen/about_us.dart';

class Panduan extends StatelessWidget {
  Panduan({super.key});

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 114, 171),
        title: Text(
          "User's Guide",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white,
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (_) => MyHomeApp(),
        //       ),
        //     );
        //   },
        //   icon: const Icon(Icons.home, color: Colors.white),
        // ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                // Color.fromARGB(240, 255, 158, 120),
                Color.fromARGB(171, 255, 255, 255),
                Color.fromARGB(255, 0, 187, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          children: [
            Container(
                // color: Colors.amber,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/Status.png',
                    width: 400,
                  ),
                ),
                Container(
                  width: 350,
                  child: Text.rich(
                    TextSpan(
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      text:
                          'In the subject status, the condition status of the detected subject will be displayed. There are three types of conditions that represent the state experienced by the subject:',
                      children: [
                        TextSpan(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                          text: ' (1) Safe, ',
                        ),
                        TextSpan(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.yellow.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                          text: '(2) Fall, ',
                        ),
                        TextSpan(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                // color: Colors.red.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                          text: 'and ',
                        ),
                        TextSpan(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.red.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                          text: '(3) Fatal Fall, ',
                        ),
                        TextSpan(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                // color: Colors.red.shade700,
                                fontWeight: FontWeight.normal),
                          ),
                          text:
                              'if there is no movement detected from the subject after falling for 2 minutes ',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            )),
            Container(
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/subcon1.png',
                          width: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '(1) Safe',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/subcon2.png',
                          width: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '(2) Fall',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.yellow.shade400,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/subcon3.png',
                          width: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '(3) Fatal Fall',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.red.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/subpoint.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 250,
                    child: Text(
                      'In the subject, the point (x) represents the left and right positions, while the point (y) indicates the depth of the subject’s position. Additionally, the point (z) corresponds to the subject’s height from the front of the radar.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/addnumb.png',
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: 350,
                    child: Text(
                      'You can add your own emergency number to call and you can see if the number is registered by the indicator color on your home page.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/nonumb.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              'Not Registered.',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/numb.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              'Registered.',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/notiff.png',
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: 350,
                    child: Text(
                      'Notifications will only appear when a fatal fall is detected, whether the application is open or running in the background.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/emer.png',
                      width: 250,
                    ),
                  ),
                  Container(
                    width: 350,
                    child: Text(
                      'There will be an emergency call button that will only appear when the subject is indicated to have experienced a critical fall.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        // color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        width: 190,
        child: Row(
          // color: Colors.transparent,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextButton(
            //   child: const Text('SKIP'),
            //   onPressed: () {},
            // ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 5,
                effect: WormEffect(
                  spacing: 20,
                  dotColor: Colors.blue.shade100,
                  activeDotColor: Colors.blue,
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn),
              ),
            ),
            // TextButton(
            //   child: const Text('NEXT'),
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
