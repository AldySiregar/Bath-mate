import 'dart:async';
// import 'dart:html';
import 'package:d_chart/commons/axis.dart';
import 'package:firebase/addnumber.dart';
import 'package:firebase/emergency.dart';
import 'package:firebase/panduanuser.dart';
import 'package:firebase/welcome.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:d_chart/d_chart.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

String _Status = "";
String _detectObject = "";
double _xPos = 0;
double _yPos = 0;
double _zPos = 0;
double _xDPos = 0;
double _yDPos = 0;
double _zDPos = 0;
String Dfall = "-";
String Dobject = "-";
String status = "";
String gambar = "assets/1.png";
String _fallCon = "";
String _emercall = "";
String _fatalFall = "";
int myIndex = 0;
var warna;
var warna1 = Colors.grey;
var warna2 = Colors.green;
var warna3 = Color.fromARGB(255, 255, 242, 0);
var warna4 = Colors.red;
bool emergencyvisib = false;

class MyHomeApp extends StatefulWidget {
  // const MyHomeApp({super.key, required this.title});
  // final String title;

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  final _database = FirebaseDatabase.instance.ref();
  late StreamSubscription _bathmate;

  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    _activateListeners();
  }

  void _activateListeners() {
    _bathmate = _database.child('subjectStatus').onValue.listen((event) {
      final fbStatus = event.snapshot.value;
      setState(() {
        _Status = '$fbStatus';
        if (_Status == '3') {
          status = 'DANGER FATAL FALL!!!';
          gambar = 'assets/4.png';
          warna = warna4;
        } else if (_Status == '2') {
          status = 'WARNING!!';
          gambar = 'assets/3.png';
          warna = warna3;
        } else if (_Status == '1') {
          status = 'In Used..';
          gambar = 'assets/2.png';
          warna = warna2;
        } else if (_Status == '0') {
          status = 'Empty :)';
          gambar = 'assets/1.png';
          warna = warna1;
        }
      });
    });
    _bathmate = _database.child('fatalFall').onValue.listen((event) {
      final fbfatalFall = event.snapshot.value;
      setState(() {
        _fatalFall = '$fbfatalFall';
        if (_fatalFall == 'true') {
          // Dfall = 'AWAS';
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: 1,
              channelKey: 'basic_channel',
              title: 'FATAL Fall Detected!',
              body: 'Please Check your family immediately!',
            ),
          );
          emergencyvisib = true;
        } else {
          emergencyvisib = false;
        }
      });
    });
    _bathmate = _database.child('fallCon').onValue.listen((event) {
      final fbfallCon = event.snapshot.value;
      setState(() {
        _fallCon = '$fbfallCon';
        if (_fallCon == 'true') {
          // Dfall = 'AWAS';
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: 1,
              channelKey: 'basic_channel',
              title: 'Fall Detected!',
              body: 'Check your family!',
            ),
          );
        }
      });
    });
    _bathmate = _database.child('title').onValue.listen((event) {
      final fbemerCall = event.snapshot.value;
      setState(
        () {
          _emercall = '$fbemerCall';
        },
      );
    });
    _bathmate = _database.child('xPos').onValue.listen((event) {
      final fbXPos = event.snapshot.value;
      setState(() {
        var _stringXPos = '$fbXPos';
        _xPos = double.parse(_stringXPos);
        String inString = _xPos.toStringAsFixed(2); // '2.35'
        _xDPos = double.parse(inString);
      });
    });
    _bathmate = _database.child('yPos').onValue.listen((event) {
      final fbYPos = event.snapshot.value;
      setState(() {
        var _stringYPos = '$fbYPos';
        _yPos = double.parse(_stringYPos);
        String inString = _yPos.toStringAsFixed(2); // '2.35'
        _yDPos = double.parse(inString);
      });
    });
    _bathmate = _database.child('zPos').onValue.listen((event) {
      final fbZPos = event.snapshot.value;
      setState(() {
        var _stringZPos = '$fbZPos';
        _zPos = double.parse(_stringZPos);
        String inString = _zPos.toStringAsFixed(2); // '2.35'
        _zDPos = double.parse(inString);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<NumericData> numericDataList = [
      NumericData(
        domain: _xDPos,
        measure: _yDPos,
      ),
    ];
    List<OrdinalData> ordinalList = [
      OrdinalData(domain: 'Z', measure: _zDPos),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 114, 171),
        title: Text(
          "Hi, welcome to our app",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
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
        //   icon: const Icon(
        //     Icons.home,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      body: Center(
        child: Container(
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
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    alignment: Alignment.center,
                    width: 340,
                    height: 40,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Subject Status',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 5,
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.center,
                  width: 340,
                  height: 243,
                  color: Color.fromARGB(255, 117, 221, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        gambar,
                        width: 320,
                        height: 200,
                      ),
                      // Text(
                      //   status,
                      // ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          alignment: Alignment.center,
                          width: 220,
                          height: 30,
                          color: warna,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                status,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
                width: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.center,
                  width: 340,
                  height: 40,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Subject Point',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ],
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
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 250,
                      width: 250,
                      // color: Color.fromARGB(255, 107, 219, 245),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 7,
                                child: Text('Y'),
                              ),
                              Container(
                                height: 230,
                                width: 230,
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: DChartScatterN(
                                    measureAxis: MeasureAxis(
                                      numericViewport:
                                          const NumericViewport(0, 4),
                                      desiredTickCount: 5,
                                      showLine: true,
                                      // gapAxisToLabel: 5,
                                      // thickLength: 5,
                                    ),
                                    domainAxis: DomainAxis(
                                        numericViewport:
                                            const NumericViewport(-2, 2)),
                                    // domainAxis: DomainAxis(
                                    //   numericViewport:
                                    //       const NumericViewport(-2, 2),
                                    //   showLine: true,
                                    //   gapAxisToLabel: 5,
                                    //   thickLength: 5,
                                    // ),

                                    configRenderPoint: ConfigRenderPoint(
                                      radiusPx: 8,
                                      strokeWidthPx: 1,
                                      symbolRender: SymbolRenderCircle(),
                                    ),
                                    // fillColor: (group, numericData, index) {
                                    //   if (group.id == 'id') {
                                    //     return numericData.color ?? Colors.red;
                                    //   }
                                    // },
                                    flipVertical: false,

                                    groupList: [
                                      NumericGroup(
                                        id: 'id',
                                        data: numericDataList,
                                        color: warna,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 15,
                            child: Text('X'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      // color: Color.fromARGB(255, 107, 219, 245),
                      color: Color.fromARGB(255, 255, 255, 255),
                      height: 250,
                      width: 80,
                      child: DChartBarO(
                        measureAxis: MeasureAxis(
                          numericViewport: const NumericViewport(0, 3),
                          desiredTickCount: 5,
                          showLine: true,
                          gapAxisToLabel: 5,
                          thickLength: 5,
                          labelAnchor: LabelAnchor.centered,
                          labelFormat: (measure) {
                            return '${measure?.toStringAsFixed(0)}';
                          },
                          labelStyle: const LabelStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          lineStyle: const LineStyle(
                            color: Colors.black,
                            thickness: 1,
                            dashPattern: [],
                          ),
                        ),
                        groupList: [
                          // OrdinalGroup(
                          //   id: "id",
                          //   data: ordinalList3,
                          //   color: Colors.amber,
                          // ),
                          OrdinalGroup(
                            id: "id",
                            data: ordinalList,
                            color: warna,
                          ),
                          // OrdinalGroup(
                          //   id: "id",
                          //   data: ordinalList2,
                          //   color: Colors.amber,
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Container(
              //       alignment: Alignment.center,
              //       width: 340,
              //       height: 50,
              //       color: Colors.grey,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Text(
              //             'X = $_xDPos m',
              //             style: TextStyle(fontSize: 15),
              //           ),
              //           Text(
              //             'Y = $_yDPos m',
              //             style: TextStyle(fontSize: 15),
              //           ),
              //           Text(
              //             'Z = $_zDPos m',
              //             style: TextStyle(fontSize: 15),
              //           ),
              //         ],
              //       )),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        alignment: Alignment.center,
                        width: 106.6,
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'X = $_xDPos m',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      width: 106.6,
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Y = $_yDPos m',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      width: 106.6,
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Z = $_zDPos m',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: emergencyvisib,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  ),
                  onPressed: () async {
                    FlutterPhoneDirectCaller.callNumber(_emercall);
                  },
                  child: Text(
                    'EMERGENCY CALL',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   showUnselectedLabels: false,
      //   selectedItemColor: Color.fromARGB(255, 0, 114, 171),
      //   backgroundColor: Color.fromARGB(255, 63, 201, 251),
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (index) {
      //     setState(() {
      //       myIndex = index;
      //     });
      //   },
      //   currentIndex: myIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //         backgroundColor: Color.fromARGB(255, 0, 114, 171)),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.phone),
      //         label: 'Phone Calls',
      //         backgroundColor: Color.fromARGB(255, 0, 114, 171)),
      //   ],
      // ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 0, 187, 255),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/aduhh.png',
                      width: 150,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Welcome(),
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
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
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
                leading: Icon(Icons.info_outline),
                title: Text(
                  "User's Guide",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
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
            ],
          ),
        ),
      ),
    );
  }
}
