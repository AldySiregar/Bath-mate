import 'package:firebase/Firebase/auth.dart';
import 'package:firebase/Screen/about_us.dart';
import 'package:firebase/Screen/home_page.dart';
import 'package:firebase/Screen/emer_number.dart';
import 'package:firebase/Screen/map_page.dart';
import 'package:firebase/Screen/radar_runtime.dart';
import 'package:firebase/Screen/user_guide.dart';
import 'package:firebase/Screen/welcome.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                        '$imgUrl',
                        fit: BoxFit.fill,
                        width: 90,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hi, ' + '' + '$userEmail',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MyHomeApp(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.phone_callback_rounded),
              title: Text(
                'Regist Emergency Number',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Insertnum(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_input_antenna_outlined),
              title: Text(
                "Radar Runtime",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RadarRuntime(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book_rounded),
              title: Text(
                "User's Guide",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Panduan(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                "About Us",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Aboutus(),
                  ),
                );
              },
            ),

            // ListTile(
            //   leading: Icon(Icons.map_outlined),
            //   title: Text(
            //     "Maps",
            //     style: GoogleFonts.poppins(
            //       textStyle: TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (_) => MapPage(),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ),
              title: Text(
                'Sign Out',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {
                AuthMethods().signOutWithGoogle(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Welcome(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
