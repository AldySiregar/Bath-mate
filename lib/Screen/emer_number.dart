import 'package:firebase/Screen/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase/Screen/user_guide.dart';
import 'package:firebase/Firebase/auth.dart';
import 'package:firebase/Screen/welcome.dart';
import 'package:firebase/Screen/about_us.dart';

String tempNumber = '';

String getNumber() {
  // String number = numController.text.toString();
  String number = tempNumber;
  return number;
}

class Insertnum extends StatefulWidget {
  const Insertnum({super.key});

  @override
  State<Insertnum> createState() => _InsertNum();
}

final numController = TextEditingController();

class _InsertNum extends State<Insertnum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 0, 114, 171),
        centerTitle: true,
        title: Text(
          "Add Emergency Number",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              // Color.fromARGB(255, 16, 198, 239),
              // Color.fromARGB(255, 242, 244, 243),
              Color.fromARGB(171, 255, 255, 255),
              Color.fromARGB(255, 0, 187, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  child: Text(
                    'Current Registered Number = ',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  child: Text(tempNumber),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            commonTestField("Number", numController, false),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (numController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Please enter all fields",
                        ),
                        duration: Duration(seconds: 2),
                      ));
                    }
                    tempNumber = numController.text.toString();
                    getNumber();
                    numController.clear();
                    FocusScope.of(context).unfocus();
                  },
                  child: Text(
                    "Add",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber(tempNumber);
                    },
                    child: Icon(Icons.phone)),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
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
                        '$userEmail',
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
              SizedBox(
                height: 400,
              ),
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
      ),
    );
  }

  Padding commonTestField(hint, controller, hide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        controller: controller,
        obscureText: hide,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
