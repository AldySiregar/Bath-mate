import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase/Screen/drawer.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 114, 171),
        title: Text(
          "About Us",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
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
        //         builder: (_) => Welcome(),
        //       ),
        //     );
        //   },
        //   icon: const Icon(Icons.home, color: Colors.white),
        // ),
      ),
      body: Column(
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
                              'assets/papa.png',
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 20,
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
                                    "Introducing SafeBath+, your reliable bathroom safety companion. With SafeBath+, you no longer need to wear devices on your body. Simply mount it on your bathroom wall, connect it to your home Wi-Fi, and enjoy peace of mind.",
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
                                width: 370,
                                child: Text(
                                  "SafeBath+ uses innovative FMCW radar technology for accurate fall detection while ensuring data privacy. Plus, with our integrated emergency call feature, you’re just one tap away from contacting emergency medical services. Stay safe with SafeBath+, it’s like having a silent guardian watching over your loved ones.",
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
                            height: 30,
                          ),
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
                                      color: Colors.white,
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(500),
                                        child: Image.asset(
                                          'assets/Pak fiky.jpeg',
                                          width: 90,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Dr.-Ing. Fiky Y.Suratman',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '1st Advisor',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(500),
                                        child: Image.asset(
                                          'assets/Bu isti.jpg',
                                          width: 85,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Istiqomah, S.T., M.Sc.',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '2nd Advisor',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
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
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 20,
                                // width: 130,
                                child: Text(
                                  'Developed by  "FYS 1"',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(600),
                                    child: Image.asset(
                                      'assets/edit2joja.jpg',
                                      width: 70,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'SJE',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '1102201692',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 55,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(600),
                                    child: Image.asset(
                                      'assets/editsije.jpg',
                                      width: 70,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'JAW',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '1102204524',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 55,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(600),
                                    child: Image.asset(
                                      'assets/edit3aldyy.jpg',
                                      width: 70,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'JAY',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '1102204439',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Image.asset('assets/play_store_512.png'),
                            width: 50,
                          ),
                          SizedBox(
                            height: 5,
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
      drawer: MyDrawer(),
    );
  }
}
