import 'package:firebase/homepage.dart';
import 'package:firebase/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 114, 171),
        title: Text(
          "About Our Product",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => Welcome(),
              ),
            );
          },
          icon: const Icon(Icons.home, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/aduhh.png',
                                width: 100,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 370,
                                  child: SingleChildScrollView(
                                    // height: 100,
                                    // width: 370,
                                    child: Text(
                                      "Introducing Bath-mate, your reliable bathroom safety companion. With Bath-mate, you no longer need to wear devices on your body. Simply mount it on your bathroom wall, connect it to your home Wi-Fi, and enjoy peace of mind.",
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        // textAlign: WrapAlignment.spaceBetween,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 370,
                                  child: Text(
                                    "Bath-mate uses innovative FMCW radar technology for accurate fall detection while ensuring data privacy. Stay safe with Bath-mate—it’s like having a silent guardian watching over your loved ones. Plus, with our integrated emergency call feature, you’re just one tap away from contacting emergency medical services.",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(height: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 60,
                                  child: Text(
                                    'Advisor',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(500),
                                      child: Image.asset(
                                        'assets/Pak fiky.jpeg',
                                        width: 85,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 160,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(500),
                                      child: Image.asset(
                                        'assets/Bu isti.jpg',
                                        width: 85,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Dr.-Ing. Fiky Y.Suratman',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 65,
                                    ),
                                    Container(
                                      child: Text(
                                        'Istiqomah, S.T. M.Sc',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 90,
                                      child: Text(
                                        '1st Advisor',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Container(
                                      width: 70,
                                      child: Text(
                                        '2nd Advisor',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 20,
                                  width: 120,
                                  child: Text(
                                    'Our Team  "FYS 1"',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(600),
                                  child: Image.asset(
                                    'assets/sijee.jpg',
                                    width: 70,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(600),
                                  child: Image.asset(
                                    'assets/joja.jpg',
                                    width: 70,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(600),
                                  child: Image.asset(
                                    'assets/Aldyy.jpg',
                                    width: 70,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '1102201692',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 45,
                                ),
                                Container(
                                  child: Text(
                                    '1102204524',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 45,
                                ),
                                Container(
                                  child: Text(
                                    '1102204439',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 95,
                            ),
                            Container(
                              child: Text(
                                '*COPYRIGHT 2024*',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
