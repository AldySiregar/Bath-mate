import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase/Screen/drawer.dart';

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
                          "Please input the number",
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
      drawer: MyDrawer(),
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
