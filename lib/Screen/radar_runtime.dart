import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase/Screen/drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

String _currentTime = '';
String fbStringTime = '';
var radarColor = Colors.red;

class RadarRuntime extends StatefulWidget {
  const RadarRuntime({super.key});

  @override
  State<RadarRuntime> createState() => _RadarRuntimeState();
}

class _RadarRuntimeState extends State<RadarRuntime> {
  final _database = FirebaseDatabase.instance.ref();
  late StreamSubscription _bathmate;

  void initState() {
    super.initState();
    _currentTime = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 0), (Timer t) => _getCurrentTime());
    Timer.periodic(Duration(seconds: 0), (Timer t) => _changeRadarCon());
    _activateListeners();
  }

  void _changeRadarCon() {
    if (_currentTime == fbStringTime) {
      radarColor = Colors.green;
    } else {
      radarColor = Colors.red;
    }
  }

  void _getCurrentTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _currentTime = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }

  void _activateListeners() {
    _bathmate = _database.child('timestamp').onValue.listen((event) {
      final fbTime = event.snapshot.value;
      setState(() {
        fbStringTime = '$fbTime';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 0, 114, 171),
        centerTitle: true,
        title: Text(
          "Radar Runtime",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.settings_input_antenna_outlined,
              color: radarColor,
              size: 280,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Last boot time :',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 16, 59, 151),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                alignment: Alignment.center,
                width: 220,
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('$fbStringTime WIB',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 16, 59, 151),
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
